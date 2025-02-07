#include <pthread.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

pthread_mutex_t duck = PTHREAD_MUTEX_INITIALIZER;

int global_i = 0;

typedef struct node
{
    int value;
    struct node *next;
} node;

void *insert_10_elements(void *arg)
{
    printf("running thread...\n");
    node *head = (node *)arg;
    node *current = head;

    pthread_mutex_lock(&duck);
    while (current->next)
    {
        current = current->next;
        usleep(1000);
    }

    for (int i = 0; i < 10; ++i)
    {
        node *to_insert = malloc(sizeof(node));
        to_insert->value = global_i++;
        to_insert->next = NULL;

        current->next = to_insert;
        current = current->next;
        usleep(1000);
    }
    // pthread_mutex_unlock(&duck);
    pthread_exit(NULL);
}

int main()
{
    node *head_ = malloc(sizeof(node));
    if (!head_)
    {
        printf("memory allocation failure\n");
        return -1;
    }

    head_->value = global_i++;
    head_->next = NULL;

    void *res;
    void *other_res;

    pthread_t tid;
    pthread_t other_tid;

    pthread_create(&tid, NULL, insert_10_elements, (void *)head_);
    pthread_create(&other_tid, NULL, insert_10_elements, (void *)head_);
    pthread_join(tid, &res);
    pthread_join(other_tid, &other_res);
    printf("thread joined...\n");

    node *current = head_;
    while (current)
    {
        printf("%d\n", current->value);
        current = current->next;
    }

    current = head_;
    while (current)
    {
        node *temp = current->next;
        free(current);
        current = temp;
    }
    return 0;
}

/*
// void printArray(const std::array<char, 16> &arr) {
//   std::cout << "{";
//   for (size_t i = 0; i < 16; ++i) {
//     std::cout << (int)arr[i];
//     if (i < arr.size() - 1) {
//       std::cout << ", ";
//     }
//   }
//   std::cout << "}" << std::endl;
// }

// void randomize_valid(PuzzleState &state, int moves) {
//   std::set<PuzzleState> visited;
//   visited.insert(state);

//   std::random_device rd;
//   std::mt19937 gen(rd());

//   for (int i = 0; i < moves; ++i) {
//     auto neighbors = state.getNeighbors();

//     std::vector<PuzzleState> valid_neighbors;
//     for (const auto &neighbor : neighbors) {
//       if (visited.find(neighbor) == visited.end()) {
//         valid_neighbors.push_back(neighbor);
//       }
//     }

//     if (valid_neighbors.empty()) {
//       break;
//     }

//     std::uniform_int_distribution<> dis(0, valid_neighbors.size() - 1);
//     int idx = dis(gen);

//     state = valid_neighbors[idx];
//     visited.insert(state);
//   }
// }

// TEST_CASE("find30", "[part=3]") {
//   auto min_time = std::chrono::seconds(60);
//   auto max_time = std::chrono::seconds(180);
//   int num_iters = 0;
//   int max_resets = 15;
//   int moves = 5; // Start with the largest move value
//   PuzzleState start_state(
//       {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 0});
//   PuzzleState end_state = start_state;
//   bool puzzle_solved = false;

//   const float A = 8.0f; // Max number of moves at start
//   const float B = 0.1f; // Decay rate, adjust for how quickly moves decrease

//   while (!puzzle_solved) {
//     if (max_resets <= 0) {
//       std::cout << "quitting -> program tested 15 puzzles" << std::endl;
//       REQUIRE(false);
//       break;
//     }

//     std::atomic<bool> thread_done(false);
//     size_t iterations = 0;
//     std::vector<PuzzleState> solution;

//     auto start_time = std::chrono::high_resolution_clock::now();

//     std::thread solve_thread([&]() {
//       randomize_valid(start_state, moves);
//       solution = solveAstar(start_state, end_state, &iterations);
//       thread_done = true;
//     });

//     bool timed_out = false;
//     while (!thread_done) {
//       auto elapsed = std::chrono::high_resolution_clock::now() - start_time;
//       if (std::chrono::duration_cast<std::chrono::seconds>(elapsed).count()
//       >=
//           max_time.count()) {
//         timed_out = true;
//         break;
//       }
//     }

//     if (timed_out) {
//       std::cout << "detach occur" << '\n';
//       solve_thread.detach();
//     } else {
//       solve_thread.join();
//     }

//     auto elapsed = std::chrono::high_resolution_clock::now() - start_time;
//     auto elapsed_seconds =
//         std::chrono::duration_cast<std::chrono::seconds>(elapsed).count();

//     if (timed_out) {
//       std::cout << "Elapsed time greater than " << max_time.count()
//                 << " seconds\n";
//       std::cout << "resetting puzzle...\n";
//       std::cout << "moves: " << moves << '\n';
//       start_state = end_state;
//       --max_resets;
//     } else {
//       // Calculate moves dynamically using exponential decay
//       moves = static_cast<int>(A * std::exp(-B * elapsed_seconds));

//       // Ensure moves doesn't drop below a minimum value (optional, for
//       // safety)
//       moves = std::max(moves, 1); // To avoid moves being zero

//       if (elapsed_seconds > 1) {
//         std::cout << "Elapsed time: " << elapsed_seconds << " seconds\n";
//         if (elapsed_seconds < min_time.count()) {
//           std::cout << "adjusting difficulty -> harder\n";
//           std::cout << "moves: " << moves << '\n';
//         } else {
//           std::cout << "Puzzle solved!\n";
//           std::cout << start_state << '\n';
//           printArray(start_state.asArray());
//           std::cout << "total iterations: " << num_iters << std::endl;
//           std::cout << "moves: " << moves << '\n';
//           puzzle_solved = true;
//           REQUIRE(true);
//           return;
//         }
//       }
//     }
//     ++num_iters;
//     if (elapsed_seconds > 1) {
//       printArray(start_state.asArray());
//       std::cout << '\n';
//     }
//   }
// }

*/