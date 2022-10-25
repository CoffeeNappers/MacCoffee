package com.vk.masks;

import android.content.Context;
import android.support.v4.view.ViewPager;
import android.view.View;
import com.vk.attachpicker.widget.ViewPagerAdapter;
import com.vk.masks.MasksView;
import com.vk.masks.model.Mask;
import com.vk.masks.model.MaskSection;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class MasksPagerAdapter extends ViewPagerAdapter {
    private final Context context;
    private final MasksContainer masksContainer;
    private final MasksView.OnMaskSelectedListener onMaskSelectedListener;
    private final ArrayList<MaskSection> sections = new ArrayList<>();
    private Mask selectedMask;

    public MasksPagerAdapter(Context context, MasksContainer container, MasksView.OnMaskSelectedListener onMaskSelectedListener) {
        this.onMaskSelectedListener = onMaskSelectedListener;
        this.masksContainer = container;
        this.context = context;
    }

    public void setSections(ArrayList<MaskSection> sections, boolean notifyDatasetChanged) {
        this.sections.clear();
        this.sections.addAll(sections);
        if (notifyDatasetChanged) {
            notifyDataSetChanged();
        }
    }

    @Override // com.vk.attachpicker.widget.ViewPagerAdapter
    public View getView(int position, ViewPager pager) {
        MasksView masksView = new MasksView(this.context, this.masksContainer, this.sections.get(position).id, this.onMaskSelectedListener);
        masksView.setSelectedMask(this.selectedMask);
        return masksView;
    }

    @Override // android.support.v4.view.PagerAdapter
    public int getCount() {
        return this.sections.size();
    }

    @Override // android.support.v4.view.PagerAdapter
    public int getItemPosition(Object object) {
        return -2;
    }

    public void setSelectedMask(Mask selectedMask) {
        this.selectedMask = selectedMask;
    }

    public MaskSection getSection(int pos) {
        return this.sections.get(pos);
    }

    public int findIndexBySectionId(int sectionId) {
        for (int i = 0; i < this.sections.size(); i++) {
            if (sectionId == this.sections.get(i).id) {
                return i;
            }
        }
        return -1;
    }
}
