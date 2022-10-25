package com.vk.attachpicker.util;

import java.util.Arrays;
/* loaded from: classes2.dex */
public class DynamicFloatArray {
    private float[] data;
    private int size;

    public DynamicFloatArray() {
        this.data = new float[16];
        this.size = 0;
    }

    public DynamicFloatArray(int capacity) {
        this.data = new float[capacity < 16 ? 16 : capacity];
        this.size = 0;
    }

    public void copyTo(DynamicFloatArray a) {
        a.ensureCapacity(this.size);
        System.arraycopy(this.data, 0, a.data, 0, this.size);
        a.size = this.size;
    }

    public float[] getData() {
        return this.data;
    }

    public void ensureCapacity(int minCapacity) {
        int oldCapacity = this.data.length;
        if (minCapacity > oldCapacity) {
            int newCapacity = oldCapacity * 2;
            if (newCapacity < minCapacity) {
                newCapacity = minCapacity;
            }
            this.data = Arrays.copyOf(this.data, newCapacity);
        }
    }

    public int size() {
        return this.size;
    }

    public boolean isEmpty() {
        return this.size == 0;
    }

    private void rangeCheck(int index) {
        if (index >= this.size || index < 0) {
            throw new IndexOutOfBoundsException("Index: " + index + ", Size: " + this.size);
        }
    }

    public float get(int index) {
        rangeCheck(index);
        return this.data[index];
    }

    public boolean add(float element) {
        ensureCapacity(this.size + 1);
        float[] fArr = this.data;
        int i = this.size;
        this.size = i + 1;
        fArr[i] = element;
        return true;
    }

    public void clear() {
        this.size = 0;
    }

    public float set(int index, float element) {
        rangeCheck(index);
        float oldValue = this.data[index];
        this.data[index] = element;
        return oldValue;
    }

    public float capacity() {
        return this.data.length;
    }
}
