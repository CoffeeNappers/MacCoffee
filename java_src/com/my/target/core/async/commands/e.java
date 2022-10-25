package com.my.target.core.async.commands;

import android.content.Context;
import com.my.target.core.async.commands.c;
import java.util.List;
/* compiled from: LoadInstreamAdCommand.java */
/* loaded from: classes2.dex */
public class e extends c {
    public e(com.my.target.core.models.d dVar, com.my.target.core.a aVar, Context context) {
        super(dVar, aVar, context);
    }

    public e(Context context) {
        super(context);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.my.target.core.async.commands.c, com.my.target.core.async.commands.a
    public void c() {
        if (this.e != null) {
            super.c();
            if (this.c != 0) {
                a(this.e.l(), (com.my.target.core.models.c) this.c, new c.a());
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void a(List<com.my.target.core.models.d> list, com.my.target.core.models.c cVar, c.a aVar) {
        for (com.my.target.core.models.d dVar : list) {
            do {
                aVar.a(dVar.m());
                if (aVar.a) {
                    com.my.target.core.async.a.a(dVar.k(), "serviceRequested", this.b);
                    com.my.target.core.models.sections.i iVar = null;
                    if (this.f.c().equals("instreamads")) {
                        iVar = cVar.c("instreamads");
                    } else if (this.f.c().equals("instreamaudioads")) {
                        iVar = cVar.c("instreamaudioads");
                    }
                    int i = 0;
                    if (iVar != null) {
                        i = iVar.b();
                    }
                    com.my.target.core.parsers.b.a(aVar.c, cVar, this.f, dVar, this.b);
                    a(dVar.l(), cVar, aVar);
                    if (iVar == null) {
                        if (this.f.c().equals("instreamads")) {
                            iVar = cVar.c("instreamads");
                        } else if (this.f.c().equals("instreamaudioads")) {
                            iVar = cVar.c("instreamaudioads");
                        }
                    }
                    if (i == (iVar != null ? iVar.b() : i)) {
                        com.my.target.core.async.a.a(dVar.k(), "serviceAnswerEmpty", this.b);
                        dVar = dVar.e();
                    }
                }
            } while (dVar != null);
        }
    }
}
