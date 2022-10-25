package com.google.firebase.database;

import com.google.android.gms.internal.zzaml;
/* loaded from: classes2.dex */
public class Transaction {

    /* loaded from: classes2.dex */
    public interface Handler {
        Result doTransaction(MutableData mutableData);

        void onComplete(DatabaseError databaseError, boolean z, DataSnapshot dataSnapshot);
    }

    /* loaded from: classes2.dex */
    public static class Result {
        private boolean aZC;
        private zzaml aZD;

        private Result(boolean z, zzaml zzamlVar) {
            this.aZC = z;
            this.aZD = zzamlVar;
        }

        public boolean isSuccess() {
            return this.aZC;
        }

        public zzaml zzcqy() {
            return this.aZD;
        }
    }

    public static Result abort() {
        return new Result(false, null);
    }

    public static Result success(MutableData mutableData) {
        return new Result(true, mutableData.zzcqy());
    }
}
