package uk.co.senab.actionbarpulltorefresh.library;

import com.vkontakte.android.R;
/* loaded from: classes3.dex */
public final class Options {
    private static final int DEFAULT_HEADER_LAYOUT = 2130903165;
    private static final boolean DEFAULT_REFRESH_MINIMIZE = true;
    private static final int DEFAULT_REFRESH_MINIMIZED_DELAY = 1000;
    private static final boolean DEFAULT_REFRESH_ON_UP = false;
    private static final float DEFAULT_REFRESH_SCROLL_DISTANCE = 0.3f;
    EnvironmentDelegate environmentDelegate = null;
    int headerLayout = R.layout.default_header;
    HeaderTransformer headerTransformer = null;
    float refreshScrollDistance = 0.3f;
    boolean refreshOnUp = false;
    int refreshMinimizeDelay = 1000;
    boolean refreshMinimize = true;

    public static Builder create() {
        return new Builder();
    }

    /* loaded from: classes3.dex */
    public static class Builder {
        final Options mOptions = new Options();

        public Builder environmentDelegate(EnvironmentDelegate environmentDelegate) {
            this.mOptions.environmentDelegate = environmentDelegate;
            return this;
        }

        public Builder headerLayout(int headerLayoutId) {
            this.mOptions.headerLayout = headerLayoutId;
            return this;
        }

        public Builder headerTransformer(HeaderTransformer headerTransformer) {
            this.mOptions.headerTransformer = headerTransformer;
            return this;
        }

        public Builder scrollDistance(float refreshScrollDistance) {
            this.mOptions.refreshScrollDistance = refreshScrollDistance;
            return this;
        }

        public Builder refreshOnUp(boolean enabled) {
            this.mOptions.refreshOnUp = enabled;
            return this;
        }

        public Builder noMinimize() {
            this.mOptions.refreshMinimize = false;
            return this;
        }

        public Builder minimize() {
            return minimize(1000);
        }

        public Builder minimize(int delay) {
            this.mOptions.refreshMinimizeDelay = delay;
            this.mOptions.refreshMinimize = true;
            return this;
        }

        public Options build() {
            return this.mOptions;
        }
    }
}
