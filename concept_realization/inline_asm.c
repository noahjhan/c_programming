void _start() {
  long syscall_number = 1;  // syscall number for write
  long fd = 1;              // File descriptor (stdout)
  char msg[] = "Hello, world!\n";
  long len = 14;  // Message length

  asm volatile("syscall"
               :
               : "r"(syscall_number), "r"(fd), "r"(msg), "r"(len)
               : "r11", "memory"  // Removed "rcx" from clobber list
  );

  // Exit system call (syscall number 60)
  long exit_syscall = 60;
  long exit_status = 0;
  asm volatile("syscall"
               :
               : "r"(exit_syscall), "r"(exit_status)
               : "r11", "memory");
}

