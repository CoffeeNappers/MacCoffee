package com.vkontakte.android.ui.adapters;

import android.content.Context;
import android.support.annotation.NonNull;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;
import com.vkontakte.android.Relation;
/* loaded from: classes3.dex */
public class RelationAdapter extends ArrayAdapter<Relation> {
    private final boolean isMale;

    public RelationAdapter(boolean isMale, Context context, int resource, Relation[] objects) {
        super(context, resource, objects);
        this.isMale = isMale;
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public long getItemId(int position) {
        Relation relation = getItem(position);
        if (relation == null) {
            return 0L;
        }
        return relation.id;
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    @NonNull
    public View getView(int position, View convertView, @NonNull ViewGroup parent) {
        View view = super.getView(position, convertView, parent);
        Relation relation = getItem(position);
        if ((view instanceof TextView) && relation != null) {
            ((TextView) view).setText(relation.getName(getContext(), this.isMale));
        }
        return view;
    }

    @Override // android.widget.ArrayAdapter, android.widget.BaseAdapter, android.widget.SpinnerAdapter
    public View getDropDownView(int position, View convertView, @NonNull ViewGroup parent) {
        View view = super.getDropDownView(position, convertView, parent);
        Relation relation = getItem(position);
        if ((view instanceof TextView) && relation != null) {
            ((TextView) view).setText(relation.getName(getContext(), this.isMale));
        }
        return view;
    }
}
