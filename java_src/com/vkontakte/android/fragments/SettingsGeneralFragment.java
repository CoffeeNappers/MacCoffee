package com.vkontakte.android.fragments;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.support.v14.preference.SwitchPreference;
import android.support.v7.preference.ListPreference;
import android.support.v7.preference.Preference;
import android.support.v7.preference.PreferenceCategory;
import android.util.SparseArray;
import com.vk.core.network.Network;
import com.vk.core.util.ToastUtils;
import com.vk.imageloader.VKImageLoader;
import com.vkontakte.android.AudioMessagePlayerService;
import com.vkontakte.android.Log;
import com.vkontakte.android.NetworkProxyPreferences;
import com.vkontakte.android.ProgressCallback;
import com.vkontakte.android.R;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.audio.AudioGet;
import com.vkontakte.android.audio.AudioFacade;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import com.vkontakte.android.audio.player.SavedTracks;
import com.vkontakte.android.audio.utils.Utils;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Messages;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.utils.L;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import ru.mail.libverify.api.VerificationFactory;
/* loaded from: classes2.dex */
public class SettingsGeneralFragment extends MaterialPreferenceToolbarFragment {
    AudioFacade.StorageType currentStorageType = AudioFacade.StorageType.internal;

    @Override // com.vkontakte.android.fragments.MaterialPreferenceFragment, com.vkontakte.android.fragments.preference.PreferenceFragmentCompat, android.app.Fragment
    public void onCreate(Bundle b) {
        super.onCreate(b);
        addPreferencesFromResource(R.xml.preferences_general);
        SwitchPreference switchPreference = (SwitchPreference) findPreference("mytrackerLocationCrapEnabled");
        switchPreference.setOnPreferenceChangeListener(new Preference.OnPreferenceChangeListener() { // from class: com.vkontakte.android.fragments.SettingsGeneralFragment.1
            @Override // android.support.v7.preference.Preference.OnPreferenceChangeListener
            public boolean onPreferenceChange(Preference preference, Object newValue) {
                VKApplication.setMyTrackLocationEnable(((Boolean) newValue).booleanValue());
                try {
                    VerificationFactory.setLocationUsage(SettingsGeneralFragment.this.getActivity(), ((Boolean) newValue).booleanValue());
                    return true;
                } catch (Exception e) {
                    L.e(e, new Object[0]);
                    return true;
                }
            }
        });
        final SwitchPreference useProxyServer = (SwitchPreference) findPreference("useProxyServer");
        if (Network.getInstance().proxy().canUseProxy()) {
            useProxyServer.setChecked(Network.getInstance().proxy().isEnable());
            useProxyServer.setOnPreferenceChangeListener(new Preference.OnPreferenceChangeListener() { // from class: com.vkontakte.android.fragments.SettingsGeneralFragment.2
                @Override // android.support.v7.preference.Preference.OnPreferenceChangeListener
                public boolean onPreferenceChange(Preference preference, Object newValue) {
                    if (!Network.getInstance().proxy().isEnable() && ((Boolean) newValue).booleanValue()) {
                        Network.getInstance().proxy().enableProxyByUser(true);
                        final ProgressDialog dlg = new ProgressDialog(SettingsGeneralFragment.this.getActivity());
                        dlg.setMessage(SettingsGeneralFragment.this.getString(R.string.loading));
                        dlg.setOnDismissListener(new DialogInterface.OnDismissListener() { // from class: com.vkontakte.android.fragments.SettingsGeneralFragment.2.1
                            @Override // android.content.DialogInterface.OnDismissListener
                            public void onDismiss(DialogInterface dialog) {
                                useProxyServer.setChecked(Network.getInstance().proxy().isEnable());
                            }
                        });
                        ViewUtils.showDialogSafety(dlg);
                        Network.getInstance().proxy().verify(new NetworkProxyPreferences() { // from class: com.vkontakte.android.fragments.SettingsGeneralFragment.2.2
                            /* JADX INFO: Access modifiers changed from: protected */
                            @Override // com.vkontakte.android.NetworkProxyPreferences
                            public void onProxyEnabled() {
                                super.onProxyEnabled();
                                ViewUtils.dismissDialogSafety(dlg);
                                useProxyServer.setChecked(Network.getInstance().proxy().isEnable());
                            }

                            /* JADX INFO: Access modifiers changed from: protected */
                            @Override // com.vkontakte.android.NetworkProxyPreferences
                            public void onProxyDisabled() {
                                super.onProxyDisabled();
                                ViewUtils.dismissDialogSafety(dlg);
                                useProxyServer.setChecked(Network.getInstance().proxy().isEnable());
                                ToastUtils.showToast((int) R.string.sett_no_proxy);
                            }
                        });
                    } else {
                        Network.getInstance().proxy().enableProxyByUser(false);
                        Network.getInstance().disableProxy(false);
                        useProxyServer.setChecked(Network.getInstance().proxy().isEnable());
                    }
                    return false;
                }
            });
        } else {
            useProxyServer.setVisible(false);
        }
        if (getResources().getConfiguration().keyboard != 2) {
            Preference pref = findPreference("sendByEnter");
            ((PreferenceCategory) findPreference("app")).removePreference(pref);
        }
        if (!VKAccountManager.getCurrent().isGifAutoPlayAvailable()) {
            Preference pref2 = findPreference("gif_autoplay");
            pref2.setVisible(false);
        }
        if (!VKAccountManager.getCurrent().isVideoAutoPlayAvailable()) {
            Preference pref3 = findPreference("video_autoplay");
            pref3.setVisible(false);
        }
        Preference pref4 = findPreference("clearImageCache");
        pref4.setOnPreferenceClickListener(new Preference.OnPreferenceClickListener() { // from class: com.vkontakte.android.fragments.SettingsGeneralFragment.3
            @Override // android.support.v7.preference.Preference.OnPreferenceClickListener
            public boolean onPreferenceClick(Preference preference) {
                final ProgressDialog dlg = new ProgressDialog(SettingsGeneralFragment.this.getActivity());
                dlg.setMessage(SettingsGeneralFragment.this.getResources().getString(R.string.loading));
                dlg.show();
                dlg.setCancelable(false);
                new Thread(new Runnable() { // from class: com.vkontakte.android.fragments.SettingsGeneralFragment.3.1
                    @Override // java.lang.Runnable
                    public void run() {
                        VKImageLoader.clearAllCaches();
                        ViewUtils.dismissDialogSafety(dlg);
                    }
                }).start();
                return true;
            }
        });
        Preference pref5 = findPreference("clearMessagesCache");
        pref5.setOnPreferenceClickListener(new Preference.OnPreferenceClickListener() { // from class: com.vkontakte.android.fragments.SettingsGeneralFragment.4
            @Override // android.support.v7.preference.Preference.OnPreferenceClickListener
            public boolean onPreferenceClick(Preference preference) {
                final ProgressDialog dlg = new ProgressDialog(SettingsGeneralFragment.this.getActivity());
                dlg.setMessage(SettingsGeneralFragment.this.getResources().getString(R.string.loading));
                dlg.show();
                dlg.setCancelable(false);
                new Thread(new Runnable() { // from class: com.vkontakte.android.fragments.SettingsGeneralFragment.4.1
                    @Override // java.lang.Runnable
                    public void run() {
                        Messages.reset();
                        Messages.resetCache();
                        AudioMessagePlayerService.cleanCache();
                        ViewUtils.dismissDialogSafety(dlg);
                    }
                }).start();
                return true;
            }
        });
        Preference pref6 = findPreference("downloadAudio");
        pref6.setOnPreferenceClickListener(new Preference.OnPreferenceClickListener() { // from class: com.vkontakte.android.fragments.SettingsGeneralFragment.5
            @Override // android.support.v7.preference.Preference.OnPreferenceClickListener
            public boolean onPreferenceClick(Preference preference) {
                SettingsGeneralFragment.downloadAudio(SettingsGeneralFragment.this.getActivity());
                return true;
            }
        });
        Preference pref7 = findPreference("clearAudioCache");
        pref7.setOnPreferenceClickListener(new Preference.OnPreferenceClickListener() { // from class: com.vkontakte.android.fragments.SettingsGeneralFragment.6
            @Override // android.support.v7.preference.Preference.OnPreferenceClickListener
            public boolean onPreferenceClick(Preference preference) {
                new VKAlertDialog.Builder(SettingsGeneralFragment.this.getActivity()).setTitle(R.string.confirm).setMessage(R.string.clear_audio_cache_confirm).setPositiveButton(R.string.yes, new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.fragments.SettingsGeneralFragment.6.1
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int which) {
                        final ProgressDialog dlg = new ProgressDialog(SettingsGeneralFragment.this.getActivity());
                        dlg.setMessage(SettingsGeneralFragment.this.getResources().getString(R.string.loading));
                        dlg.show();
                        dlg.setCancelable(false);
                        new Thread(new Runnable() { // from class: com.vkontakte.android.fragments.SettingsGeneralFragment.6.1.1
                            @Override // java.lang.Runnable
                            public void run() {
                                AudioFacade.cancelDownloads();
                                AudioFacade.removeSavedTrack(new String[0]);
                                ViewUtils.dismissDialogSafety(dlg);
                            }
                        }).start();
                    }
                }).setNegativeButton(R.string.no, (DialogInterface.OnClickListener) null).show();
                return true;
            }
        });
        ListPreference memoryStorage = (ListPreference) findPreference("audioCacheLocation");
        ArrayList<String> storagePaths = new ArrayList<>();
        ArrayList<String> storageTitles = new ArrayList<>();
        Set<String> storageTitlesSet = new HashSet<>();
        for (File f : SavedTracks.getDownloadDirectories(VKApplication.context)) {
            if (f.canWrite()) {
                try {
                    boolean isSd = Utils.isSdCardPath(f);
                    String title = getString(isSd ? R.string.file_sd_card : R.string.file_internal_storage);
                    storageTitles.add(title);
                    storageTitlesSet.add(title);
                    storagePaths.add(AudioFacade.StorageType.parseFromPreferences(f.getPath()).nameForPreference);
                } catch (Exception x) {
                    L.e(x, new Object[0]);
                }
            }
        }
        memoryStorage.setEntryValues((CharSequence[]) storagePaths.toArray(new String[storagePaths.size()]));
        memoryStorage.setEntries((CharSequence[]) storageTitles.toArray(new String[storageTitles.size()]));
        String lastStorageValue = String.valueOf(memoryStorage.getValue());
        this.currentStorageType = AudioFacade.StorageType.parseFromPreferences(lastStorageValue);
        memoryStorage.setValue(this.currentStorageType.nameForPreference);
        memoryStorage.setOnPreferenceChangeListener(new Preference.OnPreferenceChangeListener() { // from class: com.vkontakte.android.fragments.SettingsGeneralFragment.7
            @Override // android.support.v7.preference.Preference.OnPreferenceChangeListener
            public boolean onPreferenceChange(Preference preference, Object val) {
                if (!val.equals(SettingsGeneralFragment.this.currentStorageType.nameForPreference)) {
                    SettingsGeneralFragment.this.moveAudioCache(SettingsGeneralFragment.this.currentStorageType, AudioFacade.StorageType.parseFromPreferences((String) val));
                    return true;
                }
                return true;
            }
        });
        if (storageTitlesSet.size() <= 1) {
            PreferenceCategory parent = (PreferenceCategory) findPreference(AudioContentProviderConstants.CACHE_PATH);
            parent.removePreference(memoryStorage);
        }
        if (VKAccountManager.getCurrent().isMusicRestricted()) {
            String[] keys = {"downloadAudio", "audioCacheLocation", "enableAudioCache", "clearAudioCache"};
            PreferenceCategory parent2 = (PreferenceCategory) findPreference(AudioContentProviderConstants.CACHE_PATH);
            for (String key : keys) {
                Preference pref8 = findPreference(key);
                if (pref8 != null) {
                    parent2.removePreference(pref8);
                }
            }
        }
    }

    @Override // com.vkontakte.android.fragments.MaterialPreferenceToolbarFragment
    protected int getTitleRes() {
        return R.string.sett_general;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void moveAudioCache(final AudioFacade.StorageType from, final AudioFacade.StorageType dest) {
        AudioFacade.stop();
        final ProgressDialog pdlg = new ProgressDialog(getActivity());
        pdlg.setProgressStyle(1);
        pdlg.setMessage(getString(R.string.moving_audio_cache));
        pdlg.setCancelable(false);
        pdlg.show();
        final ProgressCallback pc = new ProgressCallback() { // from class: com.vkontakte.android.fragments.SettingsGeneralFragment.8
            @Override // com.vkontakte.android.ProgressCallback
            public void onProgressUpdated(final int progress) {
                SettingsGeneralFragment.this.getActivity().runOnUiThread(new Runnable() { // from class: com.vkontakte.android.fragments.SettingsGeneralFragment.8.1
                    @Override // java.lang.Runnable
                    public void run() {
                        pdlg.setProgress(progress);
                    }
                });
            }

            @Override // com.vkontakte.android.ProgressCallback
            public void onSetMaxValue(final int max) {
                SettingsGeneralFragment.this.getActivity().runOnUiThread(new Runnable() { // from class: com.vkontakte.android.fragments.SettingsGeneralFragment.8.2
                    @Override // java.lang.Runnable
                    public void run() {
                        pdlg.setMax(max);
                    }
                });
            }

            @Override // com.vkontakte.android.ProgressCallback
            public void onFinished() {
                ViewUtils.dismissDialogSafety(pdlg);
            }
        };
        new Thread(new Runnable() { // from class: com.vkontakte.android.fragments.SettingsGeneralFragment.9
            @Override // java.lang.Runnable
            public void run() {
                try {
                    AudioFacade.move(from, dest, pc);
                    SettingsGeneralFragment.this.currentStorageType = dest;
                } catch (Exception x) {
                    Log.e("vk", "Error moving", x);
                    final String lmsg = x.getLocalizedMessage();
                    SettingsGeneralFragment.this.getActivity().runOnUiThread(new Runnable() { // from class: com.vkontakte.android.fragments.SettingsGeneralFragment.9.1
                        @Override // java.lang.Runnable
                        public void run() {
                            ViewUtils.dismissDialogSafety(pdlg);
                            new VKAlertDialog.Builder(SettingsGeneralFragment.this.getActivity()).setTitle(R.string.error).setMessage(SettingsGeneralFragment.this.getString(R.string.error_moving_audio_cache, new Object[]{lmsg})).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null).show();
                            ((ListPreference) SettingsGeneralFragment.this.findPreference("audioCacheLocation")).setValue(from.nameForPreference);
                        }
                    });
                }
            }
        }).start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void downloadAudio(final Context ctx) {
        new AudioGet(VKAccountManager.getCurrent().getUid()).setCallback(new SimpleCallback<VKList<MusicTrack>>(ctx) { // from class: com.vkontakte.android.fragments.SettingsGeneralFragment.10
            @Override // com.vkontakte.android.api.Callback
            public void success(final VKList<MusicTrack> audios) {
                SparseArray<ArrayList<MusicTrack>> lists = new SparseArray<>();
                Iterator it = audios.iterator();
                while (it.hasNext()) {
                    MusicTrack f = (MusicTrack) it.next();
                    if (f.getAlbumId() != 0) {
                        ArrayList<MusicTrack> l = lists.get(f.getAlbumId());
                        if (l == null) {
                            int albumId = f.getAlbumId();
                            l = new ArrayList<>();
                            lists.put(albumId, l);
                        }
                        l.add(f);
                    }
                }
                String[] items = {ctx.getString(R.string.all_music, Integer.valueOf(audios.size()))};
                new VKAlertDialog.Builder(ctx).setTitle(R.string.select_list_for_save).setItems(items, new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.fragments.SettingsGeneralFragment.10.1
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int which) {
                        if (which == 0) {
                            AudioFacade.startDownloadTracks((Collection<MusicTrack>) audios, true);
                        }
                    }
                }).show();
            }
        }).wrapProgress(ctx).exec(ctx);
    }
}
