#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>

int main() {
    int fd = open("/dev/mmcblk2", O_WRONLY);
    if (fd < 0) return 1;

    uint16_t color = 0xF800; // Red
    uint8_t buf[768000];     // 800x480 RGB565
    for (int i = 0; i < sizeof(buf); i += 2) {
        buf[i] = color >> 8;
        buf[i+1] = color & 0xFF;
    }

    lseek(fd, 512*4, SEEK_SET); // offset (optional)
    write(fd, buf, sizeof(buf));
    close(fd);
    return 0;
}
