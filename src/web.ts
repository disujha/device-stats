import { WebPlugin } from '@capacitor/core';

import type { devicePlugin } from './definitions';

export class deviceWeb extends WebPlugin implements devicePlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
