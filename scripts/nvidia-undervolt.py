# Requires python-pynvml from AUR
from pynvml import *

def main():
    IDLE_CLOCK = 210
    MAX_CLOCK = 3120
    OFFSET_CLOCK = 240
    MEMORY_OFFSET_CLOCK = 800
    POWER_LIMIT_MW = 305000

    nvmlInit()
    gpu = nvmlDeviceGetHandleByIndex(0)
    nvmlDeviceSetGpuLockedClocks(gpu, IDLE_CLOCK, MAX_CLOCK)
    nvmlDeviceSetGpcClkVfOffset(gpu, OFFSET_CLOCK)
    nvmlDeviceSetMemClkVfOffset(gpu, int(MEMORY_OFFSET_CLOCK / 2))
    nvmlDeviceSetPowerManagementLimit(gpu, POWER_LIMIT_MW)

if __name__ == "__main__":
    main()