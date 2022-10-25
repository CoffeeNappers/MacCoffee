package com.vk.masks;

import android.content.Context;
import android.location.Location;
import com.vk.attachpicker.util.LocationUtils;
import com.vk.camera.CameraPrefs;
import com.vk.core.network.RxFileDownloader;
import com.vk.core.util.FileUtils;
import com.vk.masks.model.Mask;
import com.vk.masks.model.MaskSection;
import com.vk.media.camera.CameraEffects;
import com.vk.media.camera.CameraUtilsEffects;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.masks.MasksGetById;
import com.vkontakte.android.api.masks.MasksGetModel;
import com.vkontakte.android.api.masks.MasksGetSections;
import com.vkontakte.android.api.masks.MasksMarkSectionAsViewed;
import com.vkontakte.android.api.masks.MasksResponse;
import com.vkontakte.android.auth.VKAccountManager;
import io.reactivex.Notification;
import io.reactivex.Observable;
import io.reactivex.ObservableSource;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.annotations.NonNull;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Action;
import io.reactivex.functions.BiFunction;
import io.reactivex.functions.Consumer;
import io.reactivex.functions.Function;
import io.reactivex.schedulers.Schedulers;
import java.io.File;
import java.util.ArrayList;
import java.util.HashSet;
/* loaded from: classes2.dex */
public class MasksController {
    private static volatile MasksController instance;
    private static final Function<RxFileDownloader.DownloadEvent, RxFileDownloader.DownloadEvent> roundUpProgressMap = new Function<RxFileDownloader.DownloadEvent, RxFileDownloader.DownloadEvent>() { // from class: com.vk.masks.MasksController.14
        @Override // io.reactivex.functions.Function
        /* renamed from: apply */
        public RxFileDownloader.DownloadEvent mo1190apply(@NonNull RxFileDownloader.DownloadEvent downloadEvent) throws Exception {
            if (downloadEvent.isProgressEvent() && downloadEvent.progress > 0.95f) {
                return RxFileDownloader.DownloadEvent.createProgressEvent(1.0f);
            }
            return downloadEvent;
        }
    };
    private Observable<RxFileDownloader.DownloadEvent> masksEngineModel;
    private Disposable masksEngineModelDisposable;
    private int masksEngineVersion;
    private final Function<MasksGetModel.MasksGetModelResponse, ObservableSource<RxFileDownloader.DownloadEvent>> engineDataDownload = new Function<MasksGetModel.MasksGetModelResponse, ObservableSource<RxFileDownloader.DownloadEvent>>() { // from class: com.vk.masks.MasksController.15
        {
            MasksController.this = this;
        }

        @Override // io.reactivex.functions.Function
        /* renamed from: apply */
        public ObservableSource<RxFileDownloader.DownloadEvent> mo1190apply(MasksGetModel.MasksGetModelResponse masksGetModelResponse) throws Exception {
            final Context context = VKApplication.context;
            final int serverModelVersion = masksGetModelResponse.modelVersion;
            String serverModelUrl = masksGetModelResponse.url;
            int engineDataFilesCount = CameraUtilsEffects.engineDataFilesCount(context);
            boolean hasValidEngineData = CameraUtilsEffects.engineDataExist(context) && engineDataFilesCount == MasksController.this.masksPrefs.getEngineModelFilesCount() && engineDataFilesCount > 0 && MasksController.this.masksPrefs.getEngineModelVersion() == masksGetModelResponse.modelVersion;
            if (hasValidEngineData) {
                return Observable.just(RxFileDownloader.DownloadEvent.createDoneEvent(CameraUtilsEffects.engineDataDir(context)));
            }
            File downloadFile = FileUtils.getDownloadFile("masks_model.zip");
            return RxFileDownloader.download(context, serverModelUrl, downloadFile).map(MasksController.unzipFileMap(CameraUtilsEffects.engineDataDir(context))).doOnNext(new Consumer<RxFileDownloader.DownloadEvent>() { // from class: com.vk.masks.MasksController.15.1
                {
                    AnonymousClass15.this = this;
                }

                @Override // io.reactivex.functions.Consumer
                public void accept(@NonNull RxFileDownloader.DownloadEvent downloadEvent) throws Exception {
                    if (downloadEvent.isDoneEvent()) {
                        MasksController.this.masksPrefs.setEngineModelVersion(serverModelVersion);
                        MasksController.this.masksPrefs.setEngineModelFileCount(CameraUtilsEffects.engineDataFilesCount(context));
                    }
                }
            });
        }
    };
    private final Function<ArrayList<MaskSection>, ArrayList<MaskSection>> recentMasksSectionMap = new Function<ArrayList<MaskSection>, ArrayList<MaskSection>>() { // from class: com.vk.masks.MasksController.16
        {
            MasksController.this = this;
        }

        @Override // io.reactivex.functions.Function
        /* renamed from: apply */
        public ArrayList<MaskSection> mo1190apply(ArrayList<MaskSection> maskSections) throws Exception {
            if (maskSections.size() != 0 || !MasksController.this.masksStorage.hasCachedMasks()) {
                if (!MasksController.this.masksStorage.hasCachedMasks()) {
                    maskSections.remove(MaskSection.RECENT_SECTION);
                    return maskSections;
                }
                return maskSections;
            }
            return null;
        }
    };
    private final MasksPrefs masksPrefs = MasksPrefs.instance();
    private final MasksStorage masksStorage = MasksStorage.getInstance();
    private final HashSet<Mask> currentMasksDownloads = new HashSet<>();

    public static MasksController getInstance() {
        if (instance == null) {
            synchronized (MasksController.class) {
                if (instance == null) {
                    instance = new MasksController();
                }
            }
        }
        return instance;
    }

    private MasksController() {
        if (CameraEffects.isSupported()) {
            this.masksEngineVersion = CameraEffects.getVersion();
        } else {
            this.masksEngineVersion = Integer.MAX_VALUE;
        }
    }

    public boolean isMasksAvailable() {
        return CameraEffects.isSupported() && VKAccountManager.getCurrent().isMasksAvailable();
    }

    public int getMasksEngineVersion() {
        return this.masksEngineVersion;
    }

    public boolean needDownload(Mask mask) {
        return !this.masksStorage.isDownloaded(mask) && !this.currentMasksDownloads.contains(mask);
    }

    public void raiseMask(Mask mask) {
        if (mask != null) {
            this.masksStorage.raiseMask(mask);
        }
    }

    public Observable<Mask> checkMaskForUpdates(final Mask mask) {
        if (mask == null || !this.masksStorage.isDownloaded(mask)) {
            return null;
        }
        return LocationUtils.getLastKnownLocationRx().subscribeOn(Schedulers.io()).flatMap(new Function<Location, ObservableSource<? extends MasksResponse>>() { // from class: com.vk.masks.MasksController.3
            {
                MasksController.this = this;
            }

            @Override // io.reactivex.functions.Function
            /* renamed from: apply */
            public ObservableSource<? extends MasksResponse> mo1190apply(@NonNull Location location) throws Exception {
                return location == LocationUtils.NO_LOCATION ? new MasksGetById(mask.getFullId()).toObservable() : new MasksGetById(mask.getFullId(), location.getLatitude(), location.getLongitude()).toObservable();
            }
        }).map(new Function<MasksResponse, Mask>() { // from class: com.vk.masks.MasksController.2
            {
                MasksController.this = this;
            }

            @Override // io.reactivex.functions.Function
            /* renamed from: apply */
            public Mask mo1190apply(@NonNull MasksResponse masks) throws Exception {
                return (Mask) masks.masks.get(0);
            }
        }).doOnNext(new Consumer<Mask>() { // from class: com.vk.masks.MasksController.1
            {
                MasksController.this = this;
            }

            @Override // io.reactivex.functions.Consumer
            public void accept(@NonNull Mask serverMask) throws Exception {
                if (serverMask.updateTime > mask.updateTime) {
                    MasksController.this.masksStorage.updateMask(mask);
                }
            }
        }).observeOn(AndroidSchedulers.mainThread());
    }

    public Observable<MasksMarkSectionAsViewed.Response> markSectionAsViewed(int sectionId) {
        Observable<MasksMarkSectionAsViewed.Response> observable = new MasksMarkSectionAsViewed(sectionId).toObservable();
        return observable.subscribeOn(Schedulers.io()).doOnNext(new Consumer<MasksMarkSectionAsViewed.Response>() { // from class: com.vk.masks.MasksController.5
            {
                MasksController.this = this;
            }

            @Override // io.reactivex.functions.Consumer
            public void accept(@NonNull MasksMarkSectionAsViewed.Response response) throws Exception {
                MasksController.this.masksPrefs.setSections(response.sections);
            }
        }).map(new Function<MasksMarkSectionAsViewed.Response, MasksMarkSectionAsViewed.Response>() { // from class: com.vk.masks.MasksController.4
            {
                MasksController.this = this;
            }

            @Override // io.reactivex.functions.Function
            /* renamed from: apply */
            public MasksMarkSectionAsViewed.Response mo1190apply(@NonNull MasksMarkSectionAsViewed.Response response) throws Exception {
                return new MasksMarkSectionAsViewed.Response((ArrayList) MasksController.this.recentMasksSectionMap.mo1190apply(response.sections), response.hasNewBadge);
            }
        }).observeOn(AndroidSchedulers.mainThread());
    }

    public Observable<ArrayList<MaskSection>> getSections(boolean onlyCache) {
        Observable<ArrayList<MaskSection>> cachedSections = Observable.just(this.masksPrefs.getSections()).map(this.recentMasksSectionMap).map(new Function<ArrayList<MaskSection>, ArrayList<MaskSection>>() { // from class: com.vk.masks.MasksController.6
            {
                MasksController.this = this;
            }

            @Override // io.reactivex.functions.Function
            /* renamed from: apply */
            public ArrayList<MaskSection> mo1190apply(@NonNull ArrayList<MaskSection> maskSections) throws Exception {
                if (maskSections == null || maskSections.size() == 0) {
                    return null;
                }
                return maskSections;
            }
        });
        if (onlyCache) {
            return cachedSections.observeOn(AndroidSchedulers.mainThread());
        }
        return Observable.concat(cachedSections.onErrorResumeNext(Observable.empty()), new MasksGetSections().toObservable().subscribeOn(Schedulers.io()).doOnNext(new Consumer<ArrayList<MaskSection>>() { // from class: com.vk.masks.MasksController.7
            {
                MasksController.this = this;
            }

            @Override // io.reactivex.functions.Consumer
            public void accept(@NonNull ArrayList<MaskSection> maskSections) throws Exception {
                MasksController.this.masksPrefs.setSections(maskSections);
            }
        }).map(this.recentMasksSectionMap)).observeOn(AndroidSchedulers.mainThread());
    }

    public Observable<RxFileDownloader.DownloadEvent> getMask(final Mask maskModel) {
        final String name = maskModel.getFullId();
        Observable<RxFileDownloader.DownloadEvent> maskObservable = Observable.just(maskModel).subscribeOn(Schedulers.io()).flatMap(new Function<Mask, ObservableSource<? extends RxFileDownloader.DownloadEvent>>() { // from class: com.vk.masks.MasksController.8
            {
                MasksController.this = this;
            }

            @Override // io.reactivex.functions.Function
            /* renamed from: apply */
            public ObservableSource<? extends RxFileDownloader.DownloadEvent> mo1190apply(@NonNull Mask mask) throws Exception {
                boolean maskWasDownloaded = MasksController.this.masksStorage.isDownloaded(maskModel);
                int effectsFilesCount = CameraUtilsEffects.effectFilesCount(VKApplication.context, name);
                boolean validMaskFiles = effectsFilesCount > 0 && effectsFilesCount == MasksController.this.masksStorage.getMaskFilesCount(maskModel);
                if (maskWasDownloaded && validMaskFiles) {
                    return Observable.just(RxFileDownloader.DownloadEvent.createDoneEvent(CameraUtilsEffects.effectDir(VKApplication.context, name)));
                }
                FileUtils.doubleTryDeleteFile(CameraUtilsEffects.effectDir(VKApplication.context, name));
                File downloadFile = FileUtils.getDownloadFile(name + ".zip");
                return RxFileDownloader.download(VKApplication.context, maskModel.url, downloadFile).doOnSubscribe(new Consumer<Disposable>() { // from class: com.vk.masks.MasksController.8.5
                    {
                        AnonymousClass8.this = this;
                    }

                    @Override // io.reactivex.functions.Consumer
                    public void accept(@NonNull Disposable disposable) throws Exception {
                        MasksController.this.currentMasksDownloads.add(maskModel);
                    }
                }).doOnEach(new Consumer<Notification<RxFileDownloader.DownloadEvent>>() { // from class: com.vk.masks.MasksController.8.4
                    {
                        AnonymousClass8.this = this;
                    }

                    @Override // io.reactivex.functions.Consumer
                    public void accept(@NonNull Notification<RxFileDownloader.DownloadEvent> downloadEventNotification) throws Exception {
                        MasksController.this.currentMasksDownloads.remove(maskModel);
                    }
                }).doOnDispose(new Action() { // from class: com.vk.masks.MasksController.8.3
                    {
                        AnonymousClass8.this = this;
                    }

                    @Override // io.reactivex.functions.Action
                    public void run() throws Exception {
                        MasksController.this.currentMasksDownloads.remove(maskModel);
                    }
                }).map(MasksController.roundUpProgressMap).map(MasksController.unzipFileMap(CameraUtilsEffects.effectDir(VKApplication.context, name))).doOnNext(new Consumer<RxFileDownloader.DownloadEvent>() { // from class: com.vk.masks.MasksController.8.2
                    {
                        AnonymousClass8.this = this;
                    }

                    @Override // io.reactivex.functions.Consumer
                    public void accept(@NonNull RxFileDownloader.DownloadEvent downloadEvent) throws Exception {
                        if (downloadEvent.isDoneEvent()) {
                            MasksController.this.masksStorage.saveNewMask(maskModel, CameraUtilsEffects.effectFilesCount(VKApplication.context, name));
                        }
                    }
                }).doOnError(new Consumer<Throwable>() { // from class: com.vk.masks.MasksController.8.1
                    {
                        AnonymousClass8.this = this;
                    }

                    @Override // io.reactivex.functions.Consumer
                    public void accept(@NonNull Throwable throwable) throws Exception {
                        MasksController.this.masksStorage.deleteMask(maskModel);
                        FileUtils.doubleTryDeleteFile(CameraUtilsEffects.effectDir(VKApplication.context, name));
                    }
                });
            }
        });
        return Observable.combineLatest(maskObservable, getEngineModel(), new BiFunction<RxFileDownloader.DownloadEvent, RxFileDownloader.DownloadEvent, RxFileDownloader.DownloadEvent>() { // from class: com.vk.masks.MasksController.9
            {
                MasksController.this = this;
            }

            @Override // io.reactivex.functions.BiFunction
            public RxFileDownloader.DownloadEvent apply(@NonNull RxFileDownloader.DownloadEvent mask, @NonNull RxFileDownloader.DownloadEvent model) throws Exception {
                return (!mask.isProgressEvent() || !model.isProgressEvent()) ? model.isProgressEvent() ? model : mask : mask.progress < model.progress ? mask : model;
            }
        }).subscribeOn(Schedulers.io()).observeOn(AndroidSchedulers.mainThread());
    }

    public synchronized Observable<RxFileDownloader.DownloadEvent> getEngineModel() {
        if (this.masksEngineModel == null) {
            this.masksEngineModel = new MasksGetModel(CameraEffects.getVersion()).toObservable().onErrorReturnItem(MasksGetModel.DEFAULT).flatMap(this.engineDataDownload).map(roundUpProgressMap).replay(1).autoConnect(1, MasksController$$Lambda$1.lambdaFactory$(this)).doOnError(new Consumer<Throwable>() { // from class: com.vk.masks.MasksController.12
                {
                    MasksController.this = this;
                }

                @Override // io.reactivex.functions.Consumer
                public void accept(@NonNull Throwable throwable) throws Exception {
                    MasksController.this.masksEngineModel = null;
                    MasksController.this.setMasksEngineModelDisposable(null);
                }
            }).doOnDispose(new Action() { // from class: com.vk.masks.MasksController.11
                {
                    MasksController.this = this;
                }

                @Override // io.reactivex.functions.Action
                public void run() throws Exception {
                    MasksController.this.setMasksEngineModelDisposable(null);
                }
            }).doOnComplete(new Action() { // from class: com.vk.masks.MasksController.10
                {
                    MasksController.this = this;
                }

                @Override // io.reactivex.functions.Action
                public void run() throws Exception {
                    MasksController.this.setMasksEngineModelDisposable(null);
                }
            }).subscribeOn(Schedulers.io()).observeOn(AndroidSchedulers.mainThread());
        }
        return this.masksEngineModel;
    }

    public synchronized void disposeMasksEngineModelGet() {
        if (this.masksEngineModelDisposable != null) {
            this.masksEngineModelDisposable.dispose();
            this.masksEngineModel = null;
        }
    }

    public synchronized void setMasksEngineModelDisposable(Disposable masksEngineModelDisposable) {
        this.masksEngineModelDisposable = masksEngineModelDisposable;
    }

    public synchronized void clear() {
        CameraPrefs.instance().useMediaRecorder(false);
        this.masksStorage.clear();
        disposeMasksEngineModelGet();
        this.masksEngineModel = null;
    }

    public MasksResponse recentMasks() {
        return new MasksResponse(this.masksStorage.recentMasks());
    }

    public static Function<RxFileDownloader.DownloadEvent, RxFileDownloader.DownloadEvent> unzipFileMap(final File outputPath) {
        return new Function<RxFileDownloader.DownloadEvent, RxFileDownloader.DownloadEvent>() { // from class: com.vk.masks.MasksController.13
            @Override // io.reactivex.functions.Function
            /* renamed from: apply */
            public RxFileDownloader.DownloadEvent mo1190apply(@NonNull RxFileDownloader.DownloadEvent downloadEvent) throws Exception {
                if (downloadEvent.isDoneEvent()) {
                    FileUtils.unzip(outputPath, downloadEvent.resultFile);
                    FileUtils.deleteFile(downloadEvent.resultFile);
                    return RxFileDownloader.DownloadEvent.createDoneEvent(outputPath);
                }
                return downloadEvent;
            }
        };
    }
}
