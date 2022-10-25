package com.vkontakte.android;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ShortcutInfo;
import android.content.pm.ShortcutManager;
import android.graphics.drawable.Icon;
import android.net.Uri;
import android.os.Build;
import android.os.PersistableBundle;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Messages;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
public class ShortcutManagerWrapper {
    private static final String NEW_POST_SHORTCUT_ID = "NewPostShortcut";
    private static final String NEW_STORY_SHORTCUT_ID = "NewStoryShortcut";
    private static final String SHORTCUT_EXTRA_PHOTO_KEY = "ExtraPhotoKey";
    private static final String TAG = "ShortcutManagerWrapper";
    private ArrayList<Integer> lastPeerIdsUsedForShortcuts = new ArrayList<>();

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class Holder {
        private static final ShortcutManagerWrapper INSTANCE = new ShortcutManagerWrapper();

        private Holder() {
        }
    }

    public static ShortcutManagerWrapper getInstance() {
        return Holder.INSTANCE;
    }

    public void ensureShortcuts(Context context) {
        try {
            if (Build.VERSION.SDK_INT >= 25 && context != null && VKAccountManager.getCurrent().isReal()) {
                ShortcutManager shortcutManager = (ShortcutManager) context.getSystemService(ShortcutManager.class);
                if (shortcutManager.getDynamicShortcuts().size() == 0) {
                    ArrayList<ShortcutInfo> shortcutList = new ArrayList<>();
                    shortcutList.add(createShortcutForNewStory(context));
                    shortcutList.add(createShortcutForNewPost(context));
                    shortcutManager.setDynamicShortcuts(shortcutList);
                }
            }
        } catch (Exception exc) {
            Log.e(TAG, "ensureShortcuts failed", exc);
        }
    }

    public void updateShortcuts(Context context, ArrayList<DialogEntry> dialogEntries) {
        try {
            if (Build.VERSION.SDK_INT >= 25) {
                Log.v(TAG, "updateShortcuts is called");
                if (context != null && dialogEntries != null) {
                    if (this.lastPeerIdsUsedForShortcuts.size() > 0) {
                        boolean atLeastOneDialogHasBeenChanged = false;
                        int i = 0;
                        while (true) {
                            if (i >= this.lastPeerIdsUsedForShortcuts.size()) {
                                break;
                            } else if (i < dialogEntries.size()) {
                                if (this.lastPeerIdsUsedForShortcuts.get(i).intValue() == dialogEntries.get(i).profile.uid) {
                                    i++;
                                } else {
                                    atLeastOneDialogHasBeenChanged = true;
                                    break;
                                }
                            } else {
                                atLeastOneDialogHasBeenChanged = true;
                                break;
                            }
                        }
                        if (!atLeastOneDialogHasBeenChanged) {
                            Log.v(TAG, "updateShortcuts detected no changes, exiting");
                            return;
                        }
                    }
                    Log.v(TAG, "updateShortcuts detected some changes, updating");
                    ShortcutManager shortcutManager = (ShortcutManager) context.getSystemService(ShortcutManager.class);
                    ArrayList<ShortcutInfo> shortcutList = new ArrayList<>();
                    shortcutList.add(createShortcutForNewStory(context));
                    int createdCount = 0 + 1;
                    shortcutList.add(createShortcutForNewPost(context));
                    int i2 = createdCount + 1;
                    ArrayList<Integer> peerIds = new ArrayList<>();
                    for (int i3 = 0; i3 < shortcutManager.getMaxShortcutCountPerActivity() - 2 && i3 < dialogEntries.size(); i3++) {
                        shortcutList.add(createShortcutForDialogEntry(context, dialogEntries.get(i3)));
                        peerIds.add(Integer.valueOf(dialogEntries.get(i3).profile.uid));
                    }
                    shortcutManager.setDynamicShortcuts(shortcutList);
                    this.lastPeerIdsUsedForShortcuts = peerIds;
                    List<ShortcutInfo> pinnedList = shortcutManager.getPinnedShortcuts();
                    List<ShortcutInfo> pinnedShortcutsToBeUpdated = new ArrayList<>();
                    if (pinnedList.size() > 0) {
                        for (ShortcutInfo si : pinnedList) {
                            int shortcutPeerId = getDialogPeerId(si.getId());
                            if (shortcutPeerId != 0) {
                                for (int i4 = 0; i4 < 30 && i4 < dialogEntries.size(); i4++) {
                                    DialogEntry di = dialogEntries.get(i4);
                                    if (di.profile.uid == shortcutPeerId && (!di.profile.fullName.equals(si.getLongLabel()) || (si.getExtras() != null && !di.profile.photo.equals(si.getExtras().getString(SHORTCUT_EXTRA_PHOTO_KEY))))) {
                                        pinnedShortcutsToBeUpdated.add(createShortcutForDialogEntry(context, di));
                                    }
                                }
                            }
                        }
                    }
                    if (pinnedShortcutsToBeUpdated.size() > 0) {
                        shortcutManager.updateShortcuts(pinnedShortcutsToBeUpdated);
                    }
                }
            }
        } catch (Exception e) {
            Log.e(TAG, "updateShortcuts failed", e);
        }
    }

    public void respondToUserLogout(Context context) {
        try {
            if (Build.VERSION.SDK_INT >= 25 && context != null) {
                ShortcutManager shortcutManager = (ShortcutManager) context.getSystemService(ShortcutManager.class);
                shortcutManager.removeAllDynamicShortcuts();
                this.lastPeerIdsUsedForShortcuts.clear();
                List<ShortcutInfo> pinnedList = shortcutManager.getPinnedShortcuts();
                if (pinnedList.size() > 0) {
                    List<String> pinnedIdsList = new ArrayList<>();
                    for (ShortcutInfo si : pinnedList) {
                        pinnedIdsList.add(si.getId());
                    }
                    shortcutManager.disableShortcuts(pinnedIdsList);
                }
            }
        } catch (Exception e) {
            Log.e(TAG, "respondToUserLogout failed", e);
        }
    }

    public void respondToUserLogin(Context context) {
        try {
            if (Build.VERSION.SDK_INT >= 25 && context != null) {
                ShortcutManager shortcutManager = (ShortcutManager) context.getSystemService(ShortcutManager.class);
                List<ShortcutInfo> pinnedList = shortcutManager.getPinnedShortcuts();
                if (pinnedList.size() > 0) {
                    List<String> idsToBeEnabled = new ArrayList<>();
                    for (ShortcutInfo si : pinnedList) {
                        String id = si.getId();
                        if (id.equals(NEW_POST_SHORTCUT_ID) || id.equals(NEW_STORY_SHORTCUT_ID) || isDialogShortcutBelongingToCurrentUser(id)) {
                            idsToBeEnabled.add(id);
                        }
                    }
                    if (idsToBeEnabled.size() > 0) {
                        shortcutManager.enableShortcuts(idsToBeEnabled);
                    }
                }
                updateShortcuts(context, new ArrayList<>());
            }
        } catch (Exception e) {
            Log.e(TAG, "respondToUserLogout failed", e);
        }
    }

    @TargetApi(25)
    private ShortcutInfo createShortcutForDialogEntry(Context context, DialogEntry de) {
        Intent intent = new Intent("android.intent.action.VIEW", Uri.parse("vkontakte://vk.com/write" + de.profile.uid));
        PersistableBundle pb = new PersistableBundle();
        pb.putString(SHORTCUT_EXTRA_PHOTO_KEY, de.profile.photo);
        ShortcutInfo shortcutInfo = new ShortcutInfo.Builder(context, getDialogShortcutId(de.profile.uid)).setShortLabel(de.profile.fullName).setLongLabel(de.profile.fullName).setIcon(Icon.createWithBitmap(Messages.createShortcutIcon(de.profile.photo))).setIntents(getIntentsForHandlingShortcut(context, intent)).setExtras(pb).build();
        return shortcutInfo;
    }

    @TargetApi(25)
    private ShortcutInfo createShortcutForNewPost(Context context) {
        Intent intent = new Intent("android.intent.action.VIEW", Uri.parse("vkontakte://new_post"));
        ShortcutInfo shortcutInfo = new ShortcutInfo.Builder(context, NEW_POST_SHORTCUT_ID).setShortLabel(context.getResources().getString(R.string.post)).setLongLabel(context.getResources().getString(R.string.post)).setIntents(getIntentsForHandlingShortcut(context, intent)).setIcon(Icon.createWithResource(context, (int) R.drawable.ic_shortcut_post)).build();
        return shortcutInfo;
    }

    @TargetApi(25)
    private ShortcutInfo createShortcutForNewStory(Context context) {
        Intent intent = new Intent("android.intent.action.VIEW", Uri.parse("vkontakte://new_story"));
        ShortcutInfo shortcutInfo = new ShortcutInfo.Builder(context, NEW_STORY_SHORTCUT_ID).setShortLabel(context.getResources().getString(R.string.story)).setLongLabel(context.getResources().getString(R.string.story)).setIntents(getIntentsForHandlingShortcut(context, intent)).setIcon(Icon.createWithResource(context, (int) R.drawable.ic_shortcut_story)).build();
        return shortcutInfo;
    }

    private Intent[] getIntentsForHandlingShortcut(Context context, Intent targetIntent) {
        intents[0].addFlags(268468224);
        Intent[] intents = {getMainActivityIntent(context), targetIntent};
        return intents;
    }

    private Intent getMainActivityIntent(Context context) {
        PackageManager pm = context.getPackageManager();
        Intent intent = pm.getLaunchIntentForPackage(context.getPackageName());
        intent.setPackage(null);
        return intent;
    }

    private String getDialogShortcutId(int peerId) {
        return Integer.toString(VKAccountManager.getCurrent().getUid()) + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + peerId;
    }

    private boolean isDialogShortcutBelongingToCurrentUser(String shortcutId) {
        return getDialogPeerId(shortcutId) != 0;
    }

    private int getDialogPeerId(String dialogShortcutId) {
        int ind = dialogShortcutId.indexOf(95);
        if (ind < 0) {
            return 0;
        }
        String shortcutUserId = dialogShortcutId.substring(0, ind);
        if (!Integer.toString(VKAccountManager.getCurrent().getUid()).equals(shortcutUserId)) {
            return 0;
        }
        String peerIdStr = dialogShortcutId.substring(ind + 1);
        return Integer.parseInt(peerIdStr);
    }
}
