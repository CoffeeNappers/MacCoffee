package ru.mail.libverify.sms;

import android.database.Cursor;
import com.google.android.exoplayer2.text.ttml.TtmlNode;
import com.vkontakte.android.data.ServerKeys;
import ru.mail.libverify.sms.m;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public final class f {
    Cursor a;
    private int b;
    private int c;
    private int d;
    private int e;

    public f(Cursor cursor) {
        this.a = cursor;
        this.b = cursor.getColumnIndex("_id");
        this.c = cursor.getColumnIndex(ServerKeys.TYPE);
        this.d = cursor.getColumnIndex("address");
        this.e = cursor.getColumnIndex(TtmlNode.TAG_BODY);
    }

    public final boolean a() {
        return this.a.moveToNext();
    }

    public final b b() {
        return new b(this.a.getLong(this.b), m.b.a(this.a.getInt(this.c)), this.a.getString(this.d), this.a.getString(this.e));
    }
}
