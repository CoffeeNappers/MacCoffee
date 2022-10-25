package com.vk.masks;

import com.vk.masks.model.Mask;
import java.util.ArrayList;
import java.util.HashMap;
/* loaded from: classes2.dex */
public class MasksContainer {
    private final HashMap<Integer, ArrayList<Mask>> masksContainer = new HashMap<>();
    private final HashMap<Integer, String> masksNextFroms = new HashMap<>();
    private Mask selectedMask;
    private int selectedSectionId;

    /* JADX WARN: Generic types in debug info not equals: java.lang.Object != java.util.ArrayList<com.vk.masks.model.Mask> */
    public ArrayList<Mask> masksListForSectionId(int sectionId) {
        ArrayList<Mask> list = this.masksContainer.get(Integer.valueOf(sectionId));
        if (list == null) {
            ArrayList<Mask> list2 = new ArrayList<>();
            this.masksContainer.put(Integer.valueOf(sectionId), list2);
            return list2;
        }
        return list;
    }

    public void setNextFromForSectionId(int sectionId, String nextFrom) {
        this.masksNextFroms.put(Integer.valueOf(sectionId), nextFrom);
    }

    public String getNextFromForSectionId(int sectionId) {
        return this.masksNextFroms.get(Integer.valueOf(sectionId));
    }

    public int selectedSectionId() {
        return this.selectedSectionId;
    }

    public void selectedSectionId(int selectedSectionId) {
        this.selectedSectionId = selectedSectionId;
    }

    public Mask selectedMask() {
        return this.selectedMask;
    }

    public void selectedMask(Mask selectedMask) {
        this.selectedMask = selectedMask;
    }
}
