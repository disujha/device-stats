package com.skj.plugins.devicestats;
import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;
import android.app.ActivityManager;
import android.content.Context;
import android.os.Environment;
import android.os.StatFs;

@CapacitorPlugin(name = "device")
public class devicePlugin extends Plugin {

    private device implementation = new device();

    @PluginMethod
    public void getDeviceStats(PluginCall call) {
        try {
            long totalRAM = getTotalRAM(getContext());
            long[] storageInfo = getStorageInfo();

            JSObject result = new JSObject();
            result.put("totalRAM", totalRAM);
            result.put("totalStorage", storageInfo[0]);
            result.put("freeStorage", storageInfo[1]);
            call.resolve(result);
        } catch (Exception e) {
            call.reject("Error fetching device stats", e);
        }
    }
}

