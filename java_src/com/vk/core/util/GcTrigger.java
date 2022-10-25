package com.vk.core.util;
/* loaded from: classes2.dex */
public interface GcTrigger {
    public static final GcTrigger DEFAULT = new GcTrigger() { // from class: com.vk.core.util.GcTrigger.1
        @Override // com.vk.core.util.GcTrigger
        public void runGc() {
            Runtime.getRuntime().gc();
            enqueueReferences();
            System.runFinalization();
        }

        private void enqueueReferences() {
            try {
                Thread.sleep(100L);
            } catch (InterruptedException e) {
                throw new AssertionError();
            }
        }
    };

    void runGc();
}
