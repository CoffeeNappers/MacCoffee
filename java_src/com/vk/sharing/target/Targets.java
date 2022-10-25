package com.vk.sharing.target;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
/* loaded from: classes2.dex */
public final class Targets implements Parcelable {
    public static final Parcelable.Creator<Targets> CREATOR = new Parcelable.Creator<Targets>() { // from class: com.vk.sharing.target.Targets.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public Targets mo529createFromParcel(Parcel source) {
            return new Targets(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public Targets[] mo530newArray(int size) {
            return new Targets[size];
        }
    };
    @Nullable
    private ArrayList<Target> dialogTargets;
    private boolean full;
    @Nullable
    private ArrayList<Target> groupTargets;
    @NonNull
    private String query;
    @Nullable
    private ArrayList<Target> searchResultTargets;
    private final transient LinkedList<Target> selection;

    public Targets() {
        this.selection = new LinkedList<>();
        this.query = "";
    }

    private Targets(@NonNull Parcel source) {
        boolean z = true;
        this.selection = new LinkedList<>();
        this.query = "";
        int flag = source.readInt();
        if (flag == 1) {
            this.dialogTargets = new ArrayList<>(flag);
            source.readTypedList(this.dialogTargets, Target.CREATOR);
            Iterator<Target> it = this.dialogTargets.iterator();
            while (it.hasNext()) {
                Target target = it.next();
                if (target.selected) {
                    this.selection.add(target);
                }
            }
        }
        if (source.readInt() == 1) {
            this.groupTargets = new ArrayList<>();
            source.readTypedList(this.groupTargets, Target.CREATOR);
        }
        if (source.readInt() == 1) {
            this.searchResultTargets = new ArrayList<>();
            source.readTypedList(this.searchResultTargets, Target.CREATOR);
        }
        this.full = source.readByte() != 1 ? false : z;
        this.query = source.readString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        int i = 1;
        if (this.dialogTargets != null) {
            dest.writeInt(1);
            dest.writeTypedList(this.dialogTargets);
        } else {
            dest.writeInt(0);
        }
        if (this.groupTargets != null) {
            dest.writeInt(1);
            dest.writeTypedList(this.groupTargets);
        } else {
            dest.writeInt(0);
        }
        if (this.searchResultTargets != null) {
            dest.writeInt(1);
            dest.writeTypedList(this.searchResultTargets);
        } else {
            dest.writeInt(0);
        }
        if (!this.full) {
            i = 0;
        }
        dest.writeByte((byte) i);
        dest.writeString(this.query);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public int getDialogTargetsSize() {
        if (this.dialogTargets != null) {
            return this.dialogTargets.size();
        }
        return 0;
    }

    @NonNull
    public List<Target> getDialogTargets() {
        return Collections.unmodifiableList(this.dialogTargets != null ? this.dialogTargets : Collections.emptyList());
    }

    public void addTargetsToDialogs(@NonNull ArrayList<Target> targets) {
        if (this.dialogTargets == null) {
            this.dialogTargets = new ArrayList<>();
        }
        this.dialogTargets.addAll(targets);
    }

    public void addTargetToDialogs(@NonNull Target target) {
        if (this.dialogTargets == null) {
            this.dialogTargets = new ArrayList<>();
        }
        this.dialogTargets.add(0, target);
    }

    @NonNull
    public List<Target> getGroupTargets() {
        return Collections.unmodifiableList(this.groupTargets != null ? this.groupTargets : Collections.emptyList());
    }

    public void addTargetsToGroups(@NonNull ArrayList<Target> targets) {
        if (this.groupTargets == null) {
            this.groupTargets = new ArrayList<>();
        }
        this.groupTargets.addAll(targets);
    }

    public boolean containsTarget(@NonNull Target target) {
        if (this.dialogTargets == null) {
            this.dialogTargets = new ArrayList<>();
        }
        return this.dialogTargets.contains(target);
    }

    @NonNull
    public List<Target> getSelectedTargets() {
        return Collections.unmodifiableList(this.selection);
    }

    public int getSelectedTargetsSize() {
        return this.selection.size();
    }

    public boolean toggleSelection(@NonNull Target target) {
        boolean z = false;
        if (this.dialogTargets == null) {
            return false;
        }
        Iterator<Target> it = this.dialogTargets.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            Target t = it.next();
            if (target.equals(t)) {
                target = t;
                break;
            }
        }
        if (!target.selected) {
            z = true;
        }
        target.selected = z;
        if (target.selected) {
            this.selection.add(target);
        } else {
            this.selection.remove(target);
        }
        return target.selected;
    }

    public boolean toggleGroupSelection(@NonNull Target target) {
        boolean z = false;
        if (this.groupTargets == null) {
            return false;
        }
        Iterator<Target> it = this.groupTargets.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            Target t = it.next();
            if (target.equals(t)) {
                target = t;
                break;
            }
        }
        if (!target.selected) {
            z = true;
        }
        target.selected = z;
        if (target.selected) {
            this.selection.add(target);
        } else {
            this.selection.remove(target);
        }
        return target.selected;
    }

    public boolean isTargetSelected(@NonNull Target target) {
        return this.selection.contains(target);
    }

    public void clearSelection() {
        if (this.dialogTargets != null) {
            Iterator<Target> it = this.dialogTargets.iterator();
            while (it.hasNext()) {
                Target target = it.next();
                target.selected = false;
            }
        }
        if (this.groupTargets != null) {
            Iterator<Target> it2 = this.groupTargets.iterator();
            while (it2.hasNext()) {
                Target target2 = it2.next();
                target2.selected = false;
            }
        }
        this.selection.clear();
    }

    @NonNull
    public List<Target> getSearchResultTargets() {
        return this.searchResultTargets != null ? this.searchResultTargets : Collections.emptyList();
    }

    public void setSearchResultTargets(@Nullable ArrayList<Target> targets) {
        this.searchResultTargets = targets;
        if (this.searchResultTargets != null) {
            Iterator<Target> it = this.searchResultTargets.iterator();
            while (it.hasNext()) {
                Target target = it.next();
                if (this.selection.contains(target)) {
                    target.selected = true;
                }
            }
        }
    }

    public boolean isFull() {
        return this.full;
    }

    public void setFull(boolean full) {
        this.full = full;
    }

    @NonNull
    public String getQuery() {
        return this.query;
    }

    public void setQuery(@NonNull String query) {
        this.query = query;
    }

    public boolean isDialogsLoaded() {
        return this.dialogTargets != null;
    }

    public boolean isGroupsLoaded() {
        return this.groupTargets != null;
    }
}
