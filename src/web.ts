import { WebPlugin } from '@capacitor/core';
import type { devicePlugin } from './definitions';

export class DeviceWeb extends WebPlugin implements devicePlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO (web):', options.value);
    return options;
  }

  async getDeviceStats(): Promise<{
    totalRAM: number;
    totalStorage: number;
    freeStorage: number;
  }> {
    console.warn('getDeviceStats is not available on the web platform.');
    return {
      totalRAM: 0,
      totalStorage: 0,
      freeStorage: 0,
    };
  }
}
