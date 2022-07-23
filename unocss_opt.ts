import { UnoConfig } from "https://deno.land/x/blog@0.4.2/deps.ts";
import presetWind from "https://esm.sh/@unocss/preset-wind@0.41.0?bundle&no-check";
import type { Preset } from "https://esm.sh/@unocss/core@0.41.0";

export const unocss: UnoConfig = {
  presets: [presetWind() as unknown as Preset],
  preflights: [
    {
      getCSS: () => `
              ul {
                  list-style: square;
              }
            `,
    },
  ],
};
