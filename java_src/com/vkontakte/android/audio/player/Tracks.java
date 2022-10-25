package com.vkontakte.android.audio.player;

import android.text.TextUtils;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
/* loaded from: classes2.dex */
public class Tracks {
    private final ArrayList<PlayerTrack> mList;
    private final Map<String, Integer> mMap;

    public Tracks() {
        this(new ArrayList());
    }

    private Tracks(ArrayList<PlayerTrack> tracks) {
        this.mList = tracks;
        this.mMap = new HashMap();
    }

    public PlayerTrack get(String uuid) {
        int index = indexOf(uuid);
        if (index >= 0) {
            return this.mList.get(index);
        }
        return null;
    }

    public PlayerTrack get(int index) {
        if (index < 0 || index >= this.mList.size()) {
            return null;
        }
        return this.mList.get(index);
    }

    public void add(PlayerTrack track) {
        this.mList.add(track);
        this.mMap.put(track.uuid, Integer.valueOf(this.mList.size() - 1));
    }

    public void add(PlayerTrack track, String uuid) {
        int index = indexOf(uuid);
        if (index >= 0) {
            this.mList.add(index + 1, track);
            clearMap();
            return;
        }
        add(track);
    }

    public void addAll(Collection<PlayerTrack> tracks) {
        for (PlayerTrack track : tracks) {
            add(track);
        }
    }

    public void remove(int oid, int aid) {
        Iterator<PlayerTrack> iterator = this.mList.iterator();
        while (iterator.hasNext()) {
            PlayerTrack playerTrack = iterator.next();
            if (playerTrack.oid == oid && playerTrack.aid == aid) {
                iterator.remove();
            }
        }
        clearMap();
    }

    public PlayerTrack remove(String uuid) {
        int index = indexOf(uuid);
        if (index >= 0) {
            PlayerTrack track = this.mList.remove(index);
            clearMap();
            return track;
        }
        return null;
    }

    public void clear() {
        this.mList.clear();
        clearMap();
    }

    public PlayerTrack getFirst() {
        if (this.mList.isEmpty()) {
            return null;
        }
        return this.mList.get(0);
    }

    public PlayerTrack getLast() {
        if (this.mList.isEmpty()) {
            return null;
        }
        return this.mList.get(this.mList.size() - 1);
    }

    public PlayerTrack getNext(String uuid) {
        int index = indexOf(uuid);
        if (index < 0 || index >= this.mList.size() - 1) {
            return null;
        }
        return this.mList.get(index + 1);
    }

    public PlayerTrack getPrev(String uuid) {
        int index = indexOf(uuid);
        if (index > 0) {
            return this.mList.get(index - 1);
        }
        return null;
    }

    public int size() {
        return this.mList.size();
    }

    public boolean isEmpty() {
        return this.mList.isEmpty();
    }

    public List<PlayerTrack> asList() {
        return Collections.unmodifiableList(this.mList);
    }

    public Tracks shuffle(Collection<String> firstUuids) {
        ArrayList<PlayerTrack> list = new ArrayList<>(this.mList);
        Collections.shuffle(list);
        if (firstUuids != null) {
            int index = 0;
            for (String firstUuid : firstUuids) {
                int j = 0;
                while (true) {
                    if (j < list.size()) {
                        if (!TextUtils.equals(firstUuid, list.get(j).uuid)) {
                            j++;
                        } else {
                            Collections.swap(list, j, index);
                            index++;
                            break;
                        }
                    } else {
                        break;
                    }
                }
            }
        }
        return new Tracks(list);
    }

    public void updateTracks(Map<Long, PlayerTrack> tracks) {
        for (int i = 0; i < this.mList.size(); i++) {
            PlayerTrack newTrack = tracks.get(Long.valueOf(this.mList.get(i).getId()));
            if (newTrack != null) {
                this.mList.set(i, newTrack);
            }
        }
    }

    public int indexOf(String uuid) {
        if (this.mMap.isEmpty()) {
            for (int i = 0; i < this.mList.size(); i++) {
                this.mMap.put(this.mList.get(i).uuid, Integer.valueOf(i));
            }
        }
        Integer index = this.mMap.get(uuid);
        if (index == null) {
            return -1;
        }
        return index.intValue();
    }

    public void swap(String uuid1, String uuid2) {
        Collections.swap(this.mList, indexOf(uuid1), indexOf(uuid2));
        clearMap();
    }

    private void clearMap() {
        this.mMap.clear();
    }
}
