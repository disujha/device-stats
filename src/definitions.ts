export interface devicePlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
