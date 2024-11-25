export interface devicePlugin {
  getDeviceStats(): Promise<{
    totalRAM: number;
    totalStorage: number;
    freeStorage: number;
  }>;
}
