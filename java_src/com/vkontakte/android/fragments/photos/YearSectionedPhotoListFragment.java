package com.vkontakte.android.fragments.photos;

import com.vkontakte.android.Photo;
import com.vkontakte.android.R;
import com.vkontakte.android.fragments.photos.PhotoListFragment;
import com.vkontakte.android.fragments.photos.SectionedPhotoListFragment;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes3.dex */
public class YearSectionedPhotoListFragment extends SectionedPhotoListFragment {
    private Calendar calendar = Calendar.getInstance();

    private int getYear(int time) {
        this.calendar.setTimeInMillis(time * 1000);
        return this.calendar.get(1);
    }

    @Override // com.vkontakte.android.fragments.photos.PhotoListFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.utils.Preloader.Callback
    public void onAppendItems(List<Photo> items) {
        int prevYear = this.sections.size() == 0 ? 0 : getYear(((Photo) this.data.get(this.sections.get(this.sections.size() - 1).end - 1)).date);
        SectionedPhotoListFragment.Section currentSection = this.sections.size() == 0 ? null : this.sections.get(this.sections.size() - 1);
        int i = currentSection != null ? currentSection.end : 0;
        for (Photo item : items) {
            int year = getYear(item.date);
            if (year != prevYear) {
                if (currentSection != null) {
                    currentSection.adapter = new PhotoListFragment.PhotoAdapter(currentSection.start, i - currentSection.start);
                    currentSection.end = i;
                    if (!this.sections.contains(currentSection)) {
                        this.sections.add(currentSection);
                    }
                }
                SectionedPhotoListFragment.Section s = new SectionedPhotoListFragment.Section();
                s.title = getString(R.string.year_x, new Object[]{Integer.valueOf(year)});
                s.headerAdapter = new SectionedPhotoListFragment.SectionHeaderAdapter(s.title);
                s.start = i;
                currentSection = s;
            }
            prevYear = year;
            i++;
        }
        if (currentSection != null) {
            currentSection.adapter = new PhotoListFragment.PhotoAdapter(currentSection.start, i - currentSection.start);
            currentSection.end = i;
            if (!this.sections.contains(currentSection)) {
                this.sections.add(currentSection);
            }
        }
        super.onAppendItems(items);
        this.adapter.removeAllAdapters();
        if (this.showAlbumHeader) {
            this.adapter.addAdapter(new PhotoListFragment.HeaderAdapter());
        }
        Iterator<SectionedPhotoListFragment.Section> it = this.sections.iterator();
        while (it.hasNext()) {
            SectionedPhotoListFragment.Section s2 = it.next();
            this.adapter.addAdapter(s2.headerAdapter);
            this.adapter.addAdapter(s2.adapter);
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.utils.Preloader.Callback
    public void onClearItems() {
        super.onClearItems();
        this.sections.clear();
    }
}
