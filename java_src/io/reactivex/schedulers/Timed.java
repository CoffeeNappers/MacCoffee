package io.reactivex.schedulers;

import io.reactivex.internal.functions.ObjectHelper;
import java.util.concurrent.TimeUnit;
/* loaded from: classes3.dex */
public final class Timed<T> {
    final long time;
    final TimeUnit unit;
    final T value;

    public Timed(T value, long time, TimeUnit unit) {
        this.value = value;
        this.time = time;
        this.unit = (TimeUnit) ObjectHelper.requireNonNull(unit, "unit is null");
    }

    public T value() {
        return this.value;
    }

    public TimeUnit unit() {
        return this.unit;
    }

    public long time() {
        return this.time;
    }

    public long time(TimeUnit unit) {
        return unit.convert(this.time, this.unit);
    }

    public boolean equals(Object other) {
        if (other instanceof Timed) {
            Timed<?> o = (Timed) other;
            return ObjectHelper.equals(this.value, o.value) && this.time == o.time && ObjectHelper.equals(this.unit, o.unit);
        }
        return false;
    }

    public int hashCode() {
        int h = this.value != null ? this.value.hashCode() : 0;
        return (((h * 31) + ((int) ((this.time >>> 31) ^ this.time))) * 31) + this.unit.hashCode();
    }

    public String toString() {
        return "Timed[time=" + this.time + ", unit=" + this.unit + ", value=" + this.value + "]";
    }
}
