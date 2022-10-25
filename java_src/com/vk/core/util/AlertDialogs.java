package com.vk.core.util;

import android.content.Context;
import android.support.annotation.StringRes;
import android.support.v7.app.AlertDialog;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class AlertDialogs {
    public static AlertDialogBuilder buildListActionDialog(Context context) {
        return new AlertDialogBuilder(context);
    }

    /* loaded from: classes2.dex */
    public static class AlertDialogBuilder {
        private final ArrayList<Runnable> actions;
        private final Context context;
        private final ArrayList<String> titles;

        private AlertDialogBuilder(Context context) {
            this.titles = new ArrayList<>();
            this.actions = new ArrayList<>();
            this.context = context;
        }

        public AlertDialogBuilder action(String text, Runnable action) {
            this.titles.add(text);
            this.actions.add(action);
            return this;
        }

        public AlertDialogBuilder action(@StringRes int resId, Runnable action) {
            this.titles.add(this.context.getResources().getString(resId));
            this.actions.add(action);
            return this;
        }

        public AlertDialog.Builder build() {
            String[] titlesArray = (String[]) this.titles.toArray(new String[0]);
            Runnable[] actionsArray = (Runnable[]) this.actions.toArray(new Runnable[0]);
            AlertDialog.Builder builder = new AlertDialog.Builder(this.context);
            builder.setItems(titlesArray, AlertDialogs$AlertDialogBuilder$$Lambda$1.lambdaFactory$(actionsArray));
            return builder;
        }

        public AlertDialog show() {
            return build().show();
        }
    }
}
