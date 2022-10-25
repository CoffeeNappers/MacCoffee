package com.vkontakte.android;

import android.content.Context;
import android.support.annotation.StringRes;
/* loaded from: classes2.dex */
public enum Relation {
    none(0, false, false, R.string.relation_none),
    single(1, false, false, R.string.relation_single_m, R.string.relation_single_f),
    relationship(2, true, true, R.string.relation_relationship_m, R.string.relation_relationship_f, R.string.relation_relationship_m_p, R.string.relation_relationship_f_p),
    engaged(3, true, false, R.string.relation_engaged_m, R.string.relation_engaged_f, R.string.relation_engaged_m_p, R.string.relation_engaged_f_p),
    married(4, true, false, R.string.relation_married_m, R.string.relation_married_f, R.string.relation_married_m_p, R.string.relation_married_f_p),
    civilUnion(8, true, false, R.string.relation_civilUnion, R.string.relation_civilUnion, R.string.relation_civilUnion_p, R.string.relation_civilUnion_p),
    complicated(5, true, true, R.string.relation_complicated, R.string.relation_complicated, R.string.relation_complicated_p, R.string.relation_complicated_p),
    activelySearching(6, false, false, R.string.relation_activelySearching),
    inLove(7, true, true, R.string.relation_inLove_m, R.string.relation_inLove_f, R.string.relation_inLove_m_p, R.string.relation_inLove_f_p);
    
    public final int id;
    @StringRes
    final int nameFemalePartnerRes;
    @StringRes
    final int nameFemaleRes;
    @StringRes
    final int nameMalePartnerRes;
    @StringRes
    final int nameMaleRes;
    public final boolean partner;
    public final boolean sameGender;

    Relation(int id, boolean partner, boolean sameGender, int nameRes) {
        this(id, partner, sameGender, nameRes, nameRes);
    }

    Relation(int id, boolean partner, boolean sameGender, int nameMaleRes, int nameFemaleRes) {
        this(id, partner, sameGender, nameMaleRes, nameFemaleRes, nameMaleRes, nameFemaleRes);
    }

    Relation(int id, boolean partner, boolean sameGender, int nameMaleRes, int nameFemaleRes, int nameMalePartnerRes, int nameFemalePartnerRes) {
        this.id = id;
        this.partner = partner;
        this.sameGender = sameGender;
        this.nameMaleRes = nameMaleRes;
        this.nameFemaleRes = nameFemaleRes;
        this.nameMalePartnerRes = nameMalePartnerRes;
        this.nameFemalePartnerRes = nameFemalePartnerRes;
    }

    public String getName(Context ctx, boolean isMale) {
        return ctx.getString(isMale ? this.nameMaleRes : this.nameFemaleRes);
    }

    public String getName(Context ctx, boolean isMale, String partner) {
        return ctx.getString(isMale ? this.nameMalePartnerRes : this.nameFemalePartnerRes, partner);
    }

    public static Relation getRelationsById(long id) {
        Relation[] values;
        for (Relation relation : values()) {
            if (relation.id == id) {
                return relation;
            }
        }
        return none;
    }
}
