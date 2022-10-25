package com.googlecode.mp4parser.h264.model;

import android.support.v4.view.InputDeviceCompat;
import com.googlecode.mp4parser.h264.read.CAVLCReader;
import com.googlecode.mp4parser.h264.write.CAVLCWriter;
import java.io.IOException;
/* loaded from: classes2.dex */
public class ScalingList {
    public int[] scalingList;
    public boolean useDefaultScalingMatrixFlag;

    public void write(CAVLCWriter out) throws IOException {
        if (this.useDefaultScalingMatrixFlag) {
            out.writeSE(0, "SPS: ");
            return;
        }
        int lastScale = 8;
        for (int j = 0; j < this.scalingList.length; j++) {
            if (8 != 0) {
                int deltaScale = (this.scalingList[j] - lastScale) + InputDeviceCompat.SOURCE_ANY;
                out.writeSE(deltaScale, "SPS: ");
            }
            lastScale = this.scalingList[j];
        }
    }

    public static ScalingList read(CAVLCReader is, int sizeOfScalingList) throws IOException {
        ScalingList sl = new ScalingList();
        sl.scalingList = new int[sizeOfScalingList];
        int lastScale = 8;
        int nextScale = 8;
        int j = 0;
        while (j < sizeOfScalingList) {
            if (nextScale != 0) {
                int deltaScale = is.readSE("deltaScale");
                nextScale = ((lastScale + deltaScale) + 256) % 256;
                sl.useDefaultScalingMatrixFlag = j == 0 && nextScale == 0;
            }
            int[] iArr = sl.scalingList;
            if (nextScale != 0) {
                lastScale = nextScale;
            }
            iArr[j] = lastScale;
            lastScale = sl.scalingList[j];
            j++;
        }
        return sl;
    }

    public String toString() {
        return "ScalingList{scalingList=" + this.scalingList + ", useDefaultScalingMatrixFlag=" + this.useDefaultScalingMatrixFlag + '}';
    }
}
