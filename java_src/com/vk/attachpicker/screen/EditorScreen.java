package com.vk.attachpicker.screen;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.app.Activity;
import android.app.Dialog;
import android.content.DialogInterface;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.preference.PreferenceManager;
import android.support.annotation.IdRes;
import android.support.v4.content.ContextCompat;
import android.support.v4.view.ViewPager;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import com.facebook.appevents.AppEventsConstants;
import com.vk.attachpicker.AttachResulter;
import com.vk.attachpicker.EditorAnalytics;
import com.vk.attachpicker.Picker;
import com.vk.attachpicker.SelectionContext;
import com.vk.attachpicker.crop.CropAspectRatio;
import com.vk.attachpicker.crop.CropUtils;
import com.vk.attachpicker.crop.RectCropOverlayView;
import com.vk.attachpicker.drawing.DrawingCanvas;
import com.vk.attachpicker.drawing.DrawingColors;
import com.vk.attachpicker.drawing.DrawingState;
import com.vk.attachpicker.drawing.DrawingView;
import com.vk.attachpicker.editor.ImageState;
import com.vk.attachpicker.imageeditor.LutManager;
import com.vk.attachpicker.imageeditor.SnapsterImageEditorView;
import com.vk.attachpicker.imageeditor.filter.AllInOneFilter;
import com.vk.attachpicker.imageeditor.json.ApiColorPreference;
import com.vk.attachpicker.imageeditor.json.ApiFilter;
import com.vk.attachpicker.imageeditor.json.ApiFilterWrapper;
import com.vk.attachpicker.imageeditor.json.FiltersController;
import com.vk.attachpicker.jni.Native;
import com.vk.attachpicker.mediastore.MediaStoreEntry;
import com.vk.attachpicker.screen.CropScreen;
import com.vk.attachpicker.stickers.BitmapSticker;
import com.vk.attachpicker.stickers.EditorStickerView;
import com.vk.attachpicker.stickers.Sticker;
import com.vk.attachpicker.stickers.StickerStyle;
import com.vk.attachpicker.stickers.StickersDrawingState;
import com.vk.attachpicker.stickers.StickersDrawingView;
import com.vk.attachpicker.stickers.TextSticker;
import com.vk.attachpicker.stickers.TextStickerDialog;
import com.vk.attachpicker.util.AsyncTask;
import com.vk.attachpicker.util.BitmapUtils;
import com.vk.attachpicker.util.CameraUtils;
import com.vk.attachpicker.util.OrientationLocker;
import com.vk.attachpicker.util.PickerStickers;
import com.vk.attachpicker.util.TooltipController;
import com.vk.attachpicker.util.Utils;
import com.vk.attachpicker.widget.AspectRatioFrameLayout;
import com.vk.attachpicker.widget.BgColorFrameLayout;
import com.vk.attachpicker.widget.ColorSelectorView;
import com.vk.attachpicker.widget.EditorBottomPanel;
import com.vk.attachpicker.widget.FiltersViewPager;
import com.vk.attachpicker.widget.LoadingDialog;
import com.vk.attachpicker.widget.LocalImageView;
import com.vk.attachpicker.widget.ViewPagerAdapter;
import com.vk.attachpicker.widget.VkSeekBar;
import com.vk.attachpicker.widget.WidthSelectorView;
import com.vk.core.simplescreen.BaseScreen;
import com.vk.core.util.AnimationUtils;
import com.vk.core.util.FileUtils;
import com.vk.core.util.GcTrigger;
import com.vk.core.util.Screen;
import com.vk.core.util.TimeoutLock;
import com.vk.imageloader.OnLoadCallback;
import com.vk.imageloader.VKImageLoader;
import com.vk.stories.StoriesProcessor;
import com.vkontakte.android.R;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.api.photos.PhotosAddEditorRecentSticker;
import com.vkontakte.android.functions.F0;
import com.vkontakte.android.stickers.Stickers;
import com.vkontakte.android.utils.L;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.schedulers.Schedulers;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicReference;
import org.slf4j.Marker;
/* loaded from: classes2.dex */
public class EditorScreen extends BaseScreen implements ViewTreeObserver.OnGlobalLayoutListener {
    public static final long SCREEN_OPEN_DURATION = 350;
    private View actionAuto;
    private View actionCrop;
    private View actionDrawing;
    private View actionSticker;
    private View actionText;
    private View actionsPanel;
    private View attachButton;
    private EditorBottomPanel autoBottomPanel;
    private FrameLayout autoPanel;
    private VkSeekBar autoSeekBar;
    private TextView autoTextView;
    private LocalImageView backgroundView;
    private View bottomShadow;
    private final TimeoutLock buttonClickLock;
    private View closeButton;
    private View closeButtonContainer;
    private AspectRatioFrameLayout container;
    private boolean controlsEnabled;
    private int cropBgColor;
    private CropAspectRatio currentCropAspectRatio;
    private AsyncTask<Void, Void, Void> currentTask;
    private TextStickerDialog currentTextDialog;
    private final Delegate delegate;
    private View deleteArea;
    private View deleteIconHover;
    private LinearLayout drawingBottomLayout;
    private ImageView drawingCancel;
    private ColorSelectorView drawingColorSelectorView;
    private ImageView drawingDone;
    private ImageView drawingEraser;
    private View drawingPanel;
    private ImageView drawingUndo;
    private DrawingView drawingView;
    private ImageView drawingWidth;
    private int editorBgColor;
    private FrameLayout editorContainer;
    private final EditorAnalytics editorStatistics;
    private final MediaStoreEntry entry;
    private TextView filterTitle;
    private final ArrayList<ApiFilterWrapper> filtersList;
    private SnapsterImageEditorView imageEditor;
    private final ImageState imageState;
    private int layoutPagerPosition;
    private final OrientationLocker locker;
    private FrameLayout mainContainer;
    private FrameLayout overlayContainer;
    private final ViewPager.OnPageChangeListener pageChangeListener;
    private FiltersViewPager pager;
    private FiltersAdapter pagerAdapter;
    private int pagerState;
    private BgColorFrameLayout screenView;
    private boolean shouldPlayOpenAnimation;
    private StickersDrawingView stickersDrawingView;
    private FrameLayout stickersKeyboardContainer;
    private EditorStickerView stickersView;
    private float tempAutoValue;
    private final boolean thumb;
    private TextView tooltip;
    private TooltipController tooltipController;
    private int topPadding;

    /* loaded from: classes2.dex */
    public interface Delegate {
        void startEditorCloseAnimation();
    }

    public EditorScreen(MediaStoreEntry entry, Delegate delegate, boolean thumb) {
        this.editorStatistics = EditorAnalytics.imageEditorAnalytics();
        this.buttonClickLock = new TimeoutLock(500L);
        this.filtersList = FiltersController.filters();
        this.locker = new OrientationLocker();
        this.topPadding = 0;
        this.currentCropAspectRatio = CropAspectRatio.CROP_NOT_SELECTED;
        this.pagerState = 0;
        this.pageChangeListener = new ViewPager.OnPageChangeListener() { // from class: com.vk.attachpicker.screen.EditorScreen.23
            private float lastPosition;

            {
                EditorScreen.this = this;
            }

            private int getPosition(int position, int limit, int delta) {
                if (position != delta) {
                    if (delta > 0) {
                        if (position + delta <= limit) {
                            return position + delta;
                        }
                        return ((position + delta) - limit) - 1;
                    } else if (position + delta >= 0) {
                        return position + delta;
                    } else {
                        return (limit - position) + delta + 1;
                    }
                }
                return position;
            }

            @Override // android.support.v4.view.ViewPager.OnPageChangeListener
            public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
                if (EditorScreen.this.imageEditor != null) {
                    if (this.lastPosition != position && EditorScreen.this.pagerState == 1) {
                        EditorScreen.this.updateFilter();
                    }
                    AllInOneFilter filter = EditorScreen.this.imageEditor.getFilter();
                    if (filter != null && position == this.lastPosition) {
                        if (position == EditorScreen.this.layoutPagerPosition) {
                            filter.setFilterPosition(positionOffset);
                        } else {
                            filter.setFilterPosition(positionOffset - 1.0f);
                        }
                        EditorScreen.this.imageEditor.requestRender();
                    }
                }
                this.lastPosition = position;
            }

            @Override // android.support.v4.view.ViewPager.OnPageChangeListener
            public void onPageSelected(int position) {
                int realPosition = position % EditorScreen.this.pagerAdapter.getRealCount();
                EditorScreen.this.filterTitle.setText(EditorScreen.this.pagerAdapter.getFilterWrappers().get(realPosition).name);
                ArrayList<ApiFilterWrapper> wrappers = EditorScreen.this.pagerAdapter.getFilterWrappers();
                int limit = wrappers.size() - 1;
                LutManager.populateBitmap(wrappers.get(getPosition(realPosition, limit, -2)));
                LutManager.populateBitmap(wrappers.get(getPosition(realPosition, limit, -1)));
                LutManager.populateBitmap(wrappers.get(getPosition(realPosition, limit, 1)));
                LutManager.populateBitmap(wrappers.get(getPosition(realPosition, limit, 2)));
            }

            @Override // android.support.v4.view.ViewPager.OnPageChangeListener
            public void onPageScrollStateChanged(int state) {
                EditorScreen.this.pagerState = state;
                EditorScreen.this.stickersDrawingView.setTouchEnabled((state == 1 || EditorScreen.this.drawingPanel.getVisibility() == 0) ? false : true);
                if (state == 0) {
                    EditorScreen.this.trackFilter(false);
                    EditorScreen.this.updateFilter();
                }
                EditorScreen.this.filterTitle.animate().cancel();
                if (state == 0) {
                    EditorScreen.this.filterTitle.animate().alpha(0.0f).setStartDelay(1000L).start();
                } else {
                    EditorScreen.this.filterTitle.animate().alpha(1.0f).setStartDelay(0L).start();
                }
                if (state == 1 && !EditorScreen.this.pager.isFakeDragging()) {
                    EditorScreen.this.hideTooltip();
                }
            }
        };
        this.imageState = new ImageState(entry);
        this.delegate = delegate;
        this.entry = entry;
        this.thumb = thumb;
        init();
    }

    public EditorScreen(File file, Delegate delegate, boolean thumb) {
        this.editorStatistics = EditorAnalytics.imageEditorAnalytics();
        this.buttonClickLock = new TimeoutLock(500L);
        this.filtersList = FiltersController.filters();
        this.locker = new OrientationLocker();
        this.topPadding = 0;
        this.currentCropAspectRatio = CropAspectRatio.CROP_NOT_SELECTED;
        this.pagerState = 0;
        this.pageChangeListener = new ViewPager.OnPageChangeListener() { // from class: com.vk.attachpicker.screen.EditorScreen.23
            private float lastPosition;

            {
                EditorScreen.this = this;
            }

            private int getPosition(int position, int limit, int delta) {
                if (position != delta) {
                    if (delta > 0) {
                        if (position + delta <= limit) {
                            return position + delta;
                        }
                        return ((position + delta) - limit) - 1;
                    } else if (position + delta >= 0) {
                        return position + delta;
                    } else {
                        return (limit - position) + delta + 1;
                    }
                }
                return position;
            }

            @Override // android.support.v4.view.ViewPager.OnPageChangeListener
            public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
                if (EditorScreen.this.imageEditor != null) {
                    if (this.lastPosition != position && EditorScreen.this.pagerState == 1) {
                        EditorScreen.this.updateFilter();
                    }
                    AllInOneFilter filter = EditorScreen.this.imageEditor.getFilter();
                    if (filter != null && position == this.lastPosition) {
                        if (position == EditorScreen.this.layoutPagerPosition) {
                            filter.setFilterPosition(positionOffset);
                        } else {
                            filter.setFilterPosition(positionOffset - 1.0f);
                        }
                        EditorScreen.this.imageEditor.requestRender();
                    }
                }
                this.lastPosition = position;
            }

            @Override // android.support.v4.view.ViewPager.OnPageChangeListener
            public void onPageSelected(int position) {
                int realPosition = position % EditorScreen.this.pagerAdapter.getRealCount();
                EditorScreen.this.filterTitle.setText(EditorScreen.this.pagerAdapter.getFilterWrappers().get(realPosition).name);
                ArrayList<ApiFilterWrapper> wrappers = EditorScreen.this.pagerAdapter.getFilterWrappers();
                int limit = wrappers.size() - 1;
                LutManager.populateBitmap(wrappers.get(getPosition(realPosition, limit, -2)));
                LutManager.populateBitmap(wrappers.get(getPosition(realPosition, limit, -1)));
                LutManager.populateBitmap(wrappers.get(getPosition(realPosition, limit, 1)));
                LutManager.populateBitmap(wrappers.get(getPosition(realPosition, limit, 2)));
            }

            @Override // android.support.v4.view.ViewPager.OnPageChangeListener
            public void onPageScrollStateChanged(int state) {
                EditorScreen.this.pagerState = state;
                EditorScreen.this.stickersDrawingView.setTouchEnabled((state == 1 || EditorScreen.this.drawingPanel.getVisibility() == 0) ? false : true);
                if (state == 0) {
                    EditorScreen.this.trackFilter(false);
                    EditorScreen.this.updateFilter();
                }
                EditorScreen.this.filterTitle.animate().cancel();
                if (state == 0) {
                    EditorScreen.this.filterTitle.animate().alpha(0.0f).setStartDelay(1000L).start();
                } else {
                    EditorScreen.this.filterTitle.animate().alpha(1.0f).setStartDelay(0L).start();
                }
                if (state == 1 && !EditorScreen.this.pager.isFakeDragging()) {
                    EditorScreen.this.hideTooltip();
                }
            }
        };
        this.imageState = new ImageState(file);
        this.delegate = delegate;
        this.entry = null;
        this.thumb = thumb;
        init();
    }

    private void init() {
        PickerStickers.loadFromServer();
        Stickers.get().checkServerUpdates();
    }

    @Override // com.vk.core.simplescreen.BaseScreen
    public View createView(LayoutInflater inflater) {
        View.OnClickListener onClickListener;
        this.editorBgColor = ContextCompat.getColor(getActivity(), R.color.picker_editor_bg);
        this.cropBgColor = -1;
        this.screenView = new BgColorFrameLayout(getActivity());
        this.screenView.setBackgroundColor(this.editorBgColor);
        BgColorFrameLayout bgColorFrameLayout = this.screenView;
        onClickListener = EditorScreen$$Lambda$1.instance;
        bgColorFrameLayout.setOnClickListener(onClickListener);
        inflater.inflate(R.layout.picker_screen_image_editor, this.screenView);
        this.closeButtonContainer = $(R.id.fl_close_btn_container);
        this.closeButton = $(R.id.iv_close);
        this.closeButton.setOnClickListener(EditorScreen$$Lambda$2.lambdaFactory$(this));
        this.stickersKeyboardContainer = (FrameLayout) $(R.id.fl_stickers_keyboard);
        this.mainContainer = (FrameLayout) $(R.id.fl_main_container);
        this.container = (AspectRatioFrameLayout) $(R.id.fl_container);
        this.editorContainer = (FrameLayout) $(R.id.fl_editor_container);
        this.overlayContainer = (FrameLayout) $(R.id.fl_overlay_container);
        this.stickersDrawingView = (StickersDrawingView) $(R.id.fl_stickers_container);
        this.tooltip = (TextView) $(R.id.tv_tooltip);
        this.tooltip.setMaxWidth(Screen.realWidth() - Screen.dp(144));
        this.tooltipController = new TooltipController(this.tooltip);
        this.filterTitle = (TextView) $(R.id.tv_filter_title);
        this.filterTitle.setAlpha(0.0f);
        this.filterTitle.setText(getResources().getString(R.string.picker_original));
        this.actionsPanel = $(R.id.fl_actions_panel);
        this.actionSticker = $(R.id.eav_sticker, EditorScreen$$Lambda$3.lambdaFactory$(this));
        this.actionText = $(R.id.eav_text, EditorScreen$$Lambda$4.lambdaFactory$(this));
        this.actionDrawing = $(R.id.eav_drawing, EditorScreen$$Lambda$5.lambdaFactory$(this));
        this.actionCrop = $(R.id.eav_crop, EditorScreen$$Lambda$6.lambdaFactory$(this));
        this.actionAuto = $(R.id.eav_auto, EditorScreen$$Lambda$7.lambdaFactory$(this));
        this.bottomShadow = $(R.id.view_shadow);
        this.autoPanel = (FrameLayout) $(R.id.fl_auto_panel);
        this.autoTextView = (TextView) $(R.id.tv_auto_value);
        this.autoTextView.setText(AppEventsConstants.EVENT_PARAM_VALUE_NO);
        this.autoSeekBar = (VkSeekBar) $(R.id.vsb_auto_value);
        this.autoSeekBar.setOnSeekBarChangeListener(EditorScreen$$Lambda$8.lambdaFactory$(this));
        this.autoBottomPanel = (EditorBottomPanel) $(R.id.ebp_auto);
        this.autoBottomPanel.setOnApplyClickListener(EditorScreen$$Lambda$9.lambdaFactory$(this));
        this.autoBottomPanel.setOnCancelClickListener(EditorScreen$$Lambda$10.lambdaFactory$(this));
        this.drawingView = (DrawingView) $(R.id.dv_drawing);
        this.drawingView.setOnMotionEventListener(new DrawingView.OnMotionEventListener() { // from class: com.vk.attachpicker.screen.EditorScreen.1
            {
                EditorScreen.this = this;
            }

            @Override // com.vk.attachpicker.drawing.DrawingView.OnMotionEventListener
            public void onDown() {
                EditorScreen.this.drawingUndo.setEnabled(EditorScreen.this.drawingView.getHistorySize() > 0);
            }

            @Override // com.vk.attachpicker.drawing.DrawingView.OnMotionEventListener
            public void onUp() {
            }
        });
        this.drawingPanel = $(R.id.fl_drawing_panel);
        this.drawingBottomLayout = (LinearLayout) this.drawingPanel.findViewById(R.id.ll_drawing_controls);
        this.drawingCancel = (ImageView) this.drawingBottomLayout.findViewById(R.id.iv_drawing_cancel);
        this.drawingWidth = (ImageView) this.drawingBottomLayout.findViewById(R.id.iv_drawing_width);
        this.drawingUndo = (ImageView) this.drawingBottomLayout.findViewById(R.id.iv_drawing_undo);
        this.drawingEraser = (ImageView) this.drawingBottomLayout.findViewById(R.id.iv_drawing_eraser);
        this.drawingDone = (ImageView) this.drawingBottomLayout.findViewById(R.id.iv_drawing_done);
        this.drawingCancel.setOnClickListener(EditorScreen$$Lambda$11.lambdaFactory$(this));
        this.drawingWidth.setOnClickListener(EditorScreen$$Lambda$12.lambdaFactory$(this));
        this.drawingUndo.setOnClickListener(EditorScreen$$Lambda$13.lambdaFactory$(this));
        this.drawingUndo.setOnLongClickListener(EditorScreen$$Lambda$14.lambdaFactory$(this));
        this.drawingUndo.setEnabled(false);
        this.drawingEraser.setOnClickListener(EditorScreen$$Lambda$15.lambdaFactory$(this));
        this.drawingDone.setOnClickListener(EditorScreen$$Lambda$16.lambdaFactory$(this));
        this.drawingColorSelectorView = (ColorSelectorView) $(R.id.ccv_drawing_color_selector);
        this.drawingColorSelectorView.setOnColorSelectedListener(new ColorSelectorView.OnColorSelectedListener() { // from class: com.vk.attachpicker.screen.EditorScreen.3
            int color = DrawingColors.COLORS[0];
            int brushType = 1;

            {
                EditorScreen.this = this;
            }

            @Override // com.vk.attachpicker.widget.ColorSelectorView.OnColorSelectedListener
            public void onColorSelected(int color) {
                EditorScreen.this.drawingView.setColor(color);
                EditorScreen.this.setEraserModeDisabled(this.brushType, color);
            }

            @Override // com.vk.attachpicker.widget.ColorSelectorView.OnColorSelectedListener
            public void onBrushTypeSelected(int brushType) {
                EditorScreen.this.drawingView.setBrushType(brushType);
                EditorScreen.this.setEraserModeDisabled(brushType, this.color);
            }
        });
        this.stickersDrawingView.setOnTextStickerClickListener(EditorScreen$$Lambda$17.lambdaFactory$(this));
        this.pager = (FiltersViewPager) $(R.id.vp_pager);
        this.pager.setPageMargin(Screen.dp(3.0f));
        this.pager.setPageMarginDrawable(R.drawable.picker_bg_editor_divider);
        this.pagerAdapter = new FiltersAdapter(this.filtersList);
        this.pager.setAdapter(this.pagerAdapter);
        this.pager.setCurrentItem(this.pagerAdapter.getRealCount() * ((this.pagerAdapter.getCount() / 2) / this.pagerAdapter.getRealCount()), false);
        this.pager.getViewTreeObserver().addOnGlobalLayoutListener(this);
        this.pager.addOnPageChangeListener(this.pageChangeListener);
        this.attachButton = $(R.id.tv_attach);
        this.attachButton.setOnClickListener(EditorScreen$$Lambda$18.lambdaFactory$(this));
        this.deleteArea = $(R.id.fl_delete_area);
        this.deleteIconHover = $(R.id.iv_delete_icon_hover);
        this.stickersDrawingView.setOnStickerMoveListener(new StickersDrawingView.OnStickerMoveListener() { // from class: com.vk.attachpicker.screen.EditorScreen.4
            {
                EditorScreen.this = this;
            }

            @Override // com.vk.attachpicker.stickers.StickersDrawingView.OnStickerMoveListener
            public void onStartMove() {
                EditorScreen.this.setControlsEnabled(false);
                EditorScreen.this.pager.setSwipeEnabled(false);
                EditorScreen.this.showDeleteArea(true);
                EditorScreen.this.hideTooltip();
            }

            @Override // com.vk.attachpicker.stickers.StickersDrawingView.OnStickerMoveListener
            public void onEnterRemoveArea() {
                EditorScreen.this.deleteIconHover.animate().alpha(1.0f).setDuration(200L).start();
            }

            @Override // com.vk.attachpicker.stickers.StickersDrawingView.OnStickerMoveListener
            public void onLeaveRemoveArea() {
                EditorScreen.this.deleteIconHover.animate().alpha(0.0f).setDuration(200L).start();
            }

            @Override // com.vk.attachpicker.stickers.StickersDrawingView.OnStickerMoveListener
            public void onUp() {
                EditorScreen.this.setControlsEnabled(true);
                EditorScreen.this.pager.setSwipeEnabled(true);
                EditorScreen.this.hideDeleteArea(true);
            }

            @Override // com.vk.attachpicker.stickers.StickersDrawingView.OnStickerMoveListener
            public void onTwoFingerGesture() {
                EditorScreen.this.setControlsEnabled(false);
                EditorScreen.this.pager.setSwipeEnabled(false);
                EditorScreen.this.hideDeleteArea(true);
                EditorScreen.this.hideTooltip();
            }
        });
        this.stickersDrawingView.setInterceptTouchListener(EditorScreen$$Lambda$19.lambdaFactory$(this));
        this.backgroundView = (LocalImageView) $(R.id.iv_bg);
        if (this.entry != null) {
            this.backgroundView.setOnLoadCallback(new OnLoadCallback() { // from class: com.vk.attachpicker.screen.EditorScreen.5
                {
                    EditorScreen.this = this;
                }

                @Override // com.vk.imageloader.OnLoadCallback
                public void onSuccess(int width, int height) {
                    EditorScreen.this.container.setAspectRatio(EditorScreen.this.backgroundView.getImageAspectRatio());
                    EditorScreen.this.shouldPlayOpenAnimation = true;
                }

                @Override // com.vk.imageloader.OnLoadCallback
                public void onFailure() {
                }
            });
            this.backgroundView.setImage(this.entry, true);
        }
        hideDeleteArea(false);
        setControlsEnabled(false);
        return this.screenView;
    }

    public static /* synthetic */ void lambda$createView$0(View v) {
    }

    public /* synthetic */ void lambda$createView$1(View v) {
        if (!checkButtonLock() && this.closeButtonContainer.getAlpha() == 1.0f && this.closeButton.getAlpha() == 1.0f) {
            finish();
        }
    }

    public /* synthetic */ void lambda$createView$2(VkSeekBar bar, float value) {
        if (this.imageEditor != null && this.imageEditor.getFilter() != null) {
            int v = (int) Math.ceil(100.0f * value);
            if (v == 0) {
                this.autoTextView.setText(AppEventsConstants.EVENT_PARAM_VALUE_NO);
            } else {
                this.autoTextView.setText(Marker.ANY_NON_NULL_MARKER + v);
            }
            this.imageEditor.getFilter().setEnhanceIntensity(value);
            this.imageEditor.requestRender();
        }
        this.tempAutoValue = value;
    }

    public /* synthetic */ void lambda$createView$3(View view) {
        if (!checkButtonLock()) {
            this.imageState.setAutoEnhanceValue(this.tempAutoValue);
            bottomPanelCloseAnimation(this.autoPanel);
            trackEnhance(false);
        }
    }

    public /* synthetic */ void lambda$createView$4(View view) {
        if (!checkButtonLock()) {
            cancelAutoEnhance();
        }
    }

    public /* synthetic */ void lambda$createView$5(View v) {
        if (!checkButtonLock()) {
            cancelDrawing();
        }
    }

    public /* synthetic */ void lambda$createView$6(View v) {
        WidthSelectorView.show(this.drawingWidth, this.drawingColorSelectorView.getSelectedColor(), DrawingState.findIntIndex(this.drawingView.getWidthMultiplier()), new WidthSelectorView.OnWidthSelectedListener() { // from class: com.vk.attachpicker.screen.EditorScreen.2
            {
                EditorScreen.this = this;
            }

            @Override // com.vk.attachpicker.widget.WidthSelectorView.OnWidthSelectedListener
            public void onWidthSelected(int widthIndex) {
                EditorScreen.this.drawingView.setWidthMultiplier(DrawingState.WIDTH[widthIndex]);
            }
        });
    }

    public /* synthetic */ void lambda$createView$7(View v) {
        this.drawingView.undo();
        this.drawingUndo.setEnabled(this.drawingView.getHistorySize() > 0);
    }

    public /* synthetic */ boolean lambda$createView$8(View v) {
        this.drawingView.clear();
        this.drawingUndo.setEnabled(false);
        return true;
    }

    public /* synthetic */ void lambda$createView$9(View v) {
        setEraserModeEnabled();
    }

    public /* synthetic */ void lambda$createView$10(View v) {
        this.drawingView.saveState();
        setDrawingTouchEnabled(false);
        bottomPanelCloseAnimation(this.drawingPanel);
        trackDraw(false);
    }

    public /* synthetic */ void lambda$createView$16(TextSticker textSticker) {
        if (!checkButtonLock() && this.currentTextDialog == null) {
            this.closeButtonContainer.animate().alpha(0.0f).setDuration(200L).start();
            Picker.runDelayed(EditorScreen$$Lambda$39.lambdaFactory$(this, textSticker), 100L);
            this.currentTextDialog = new TextStickerDialog(false, false, getActivity(), textSticker.getText(), textSticker.getColor(), textSticker.getStickerStyle(), EditorScreen$$Lambda$40.lambdaFactory$(this, textSticker));
            this.currentTextDialog.setOnDismissListener(EditorScreen$$Lambda$41.lambdaFactory$(this, textSticker));
            this.currentTextDialog.show();
        }
    }

    public /* synthetic */ void lambda$null$11(TextSticker textSticker) {
        if (this.currentTextDialog != null && this.currentTextDialog.isShowing()) {
            textSticker.setInEditMode(true);
            this.stickersDrawingView.invalidate();
        }
    }

    public /* synthetic */ void lambda$null$13(TextSticker textSticker, String text, int color, StickerStyle typeface) {
        if (TextUtils.isEmpty(text)) {
            this.stickersDrawingView.removeStickerView(textSticker);
        } else {
            textSticker.setText(text);
            textSticker.setColor(color);
            textSticker.setTypeface(typeface);
        }
        Picker.runDelayed(EditorScreen$$Lambda$43.lambdaFactory$(this, textSticker), 100L);
    }

    public /* synthetic */ void lambda$null$12(TextSticker textSticker) {
        textSticker.setInEditMode(false);
        this.stickersDrawingView.invalidate();
    }

    public /* synthetic */ void lambda$null$15(TextSticker textSticker, DialogInterface dialog) {
        this.closeButtonContainer.animate().alpha(1.0f).setDuration(200L).start();
        this.currentTextDialog = null;
        Picker.runDelayed(EditorScreen$$Lambda$42.lambdaFactory$(this, textSticker), 100L);
    }

    public /* synthetic */ void lambda$null$14(TextSticker textSticker) {
        textSticker.setInEditMode(false);
        this.stickersDrawingView.invalidate();
    }

    public /* synthetic */ void lambda$createView$17(View v) {
        renderAndFinish(this.thumb);
    }

    public /* synthetic */ boolean lambda$createView$18(View v, MotionEvent event) {
        if (isDrawingPanelVisible()) {
            this.drawingView.dispatchTouchEvent(event);
            return true;
        }
        this.pager.dispatchTouchEvent(event);
        return true;
    }

    private void setEraserModeEnabled() {
        this.drawingView.setBrushType(0);
        this.drawingColorSelectorView.setSelectedColor(0);
        this.drawingEraser.setColorFilter(ContextCompat.getColor(getActivity(), R.color.picker_blue));
    }

    public void setEraserModeDisabled(int brushType, int color) {
        this.drawingView.setBrushType(brushType);
        this.drawingColorSelectorView.setSelectedColor(color);
        this.drawingEraser.setColorFilter(ContextCompat.getColor(getActivity(), R.color.picker_dark_icon));
    }

    public void hideTooltip() {
        this.tooltipController.hideTooltip();
        this.pager.cancelFakeSwipe();
    }

    private void showFiltersTooltip() {
        if (TooltipController.shouldShowTooltip(TooltipController.KEY_FILTERS_TOOLTIP)) {
            this.pager.showFakeSwipe();
            this.tooltip.setText(R.string.picker_tooltip_filter);
            this.tooltipController.showTooltip();
        }
    }

    public void showStickerTooltip() {
        if (TooltipController.shouldShowTooltip(TooltipController.KEY_STICKER_TOOLTIP)) {
            this.tooltip.setText(R.string.picker_tooltip_sticker_move);
            this.tooltipController.showTooltip();
        }
    }

    private void showTextTooltip() {
        if (TooltipController.shouldShowTooltip(TooltipController.KEY_TEXT_TOOLTIP)) {
            this.tooltip.setText(R.string.picker_tooltip_text_move);
            this.tooltipController.showTooltip();
        }
    }

    public void showDeleteArea(boolean animated) {
        this.deleteArea.setVisibility(0);
        this.deleteIconHover.setAlpha(0.0f);
        if (animated) {
            this.deleteArea.setAlpha(0.0f);
            this.deleteArea.animate().alpha(1.0f).setListener(null).setDuration(200L).start();
            return;
        }
        this.deleteArea.setAlpha(1.0f);
    }

    public void hideDeleteArea(boolean animated) {
        if (this.deleteArea.getVisibility() != 4) {
            if (animated) {
                this.deleteArea.setAlpha(1.0f);
                this.deleteArea.animate().alpha(0.0f).setListener(new AnimatorListenerAdapter() { // from class: com.vk.attachpicker.screen.EditorScreen.6
                    {
                        EditorScreen.this = this;
                    }

                    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                    public void onAnimationEnd(Animator animation) {
                        EditorScreen.this.deleteArea.setVisibility(4);
                    }
                }).setDuration(200L).start();
                return;
            }
            this.deleteArea.setVisibility(4);
            this.deleteArea.setAlpha(0.0f);
        }
    }

    private void renderAndFinish(boolean avatarSelection) {
        final Activity activity = getActivity();
        if (activity != null) {
            final boolean isDefault = this.drawingView.isDefault() && this.stickersDrawingView.isDefault() && this.imageState.getGeometryState() != null && this.imageState.getGeometryState().isDefaultState() && this.imageState.getAutoEnhanceValue() <= 0.001f;
            trackStickers(true);
            trackEmoji(true);
            trackText(true);
            if (!this.drawingView.isDefault()) {
                trackDraw(true);
            }
            if (this.imageState.getGeometryState() != null && !this.imageState.getGeometryState().isDefaultState()) {
                trackCrop();
            }
            if (!isDefaultFilter()) {
                trackFilter(true);
            }
            if (this.imageState.getAutoEnhanceValue() > 0.0f) {
                trackEnhance(true);
            }
            this.editorStatistics.flush();
            final F0<Bitmap> bitmapRenderer = EditorScreen$$Lambda$20.lambdaFactory$(this);
            if (avatarSelection) {
                new AsyncTask<Void, Void, Bitmap>() { // from class: com.vk.attachpicker.screen.EditorScreen.7
                    Dialog progressDialog;

                    {
                        EditorScreen.this = this;
                    }

                    @Override // com.vk.attachpicker.util.AsyncTask
                    protected void onPreExecute() {
                        this.progressDialog = LoadingDialog.getInstance(activity, Integer.valueOf((int) R.string.picker_saving));
                        this.progressDialog.show();
                    }

                    @Override // com.vk.attachpicker.util.AsyncTask
                    public Bitmap doInBackground(Void... args) throws Throwable {
                        long start = System.currentTimeMillis();
                        Bitmap croppedBitmap = (Bitmap) bitmapRenderer.f();
                        long stop = System.currentTimeMillis();
                        if (stop - start < 500) {
                            Thread.sleep((500 - stop) + start);
                        }
                        return croppedBitmap;
                    }

                    @Override // com.vk.attachpicker.util.AsyncTask
                    public void onPostExecute(Bitmap bitmap) {
                        LoadingDialog.dismissLoadingDialog(this.progressDialog);
                        if (bitmap != null) {
                            EditorScreen.this.showScreen(new AvatarAreaSelectionScreen(bitmap));
                        } else {
                            Toast.makeText(activity, (int) R.string.picker_saving_error, 0).show();
                        }
                    }
                }.execPool(new Void[0]);
            } else {
                new AsyncTask<Void, Void, File>() { // from class: com.vk.attachpicker.screen.EditorScreen.8
                    Dialog progressDialog;

                    {
                        EditorScreen.this = this;
                    }

                    @Override // com.vk.attachpicker.util.AsyncTask
                    protected void onPreExecute() {
                        this.progressDialog = LoadingDialog.getInstance(activity, Integer.valueOf((int) R.string.picker_saving));
                        this.progressDialog.show();
                    }

                    @Override // com.vk.attachpicker.util.AsyncTask
                    public File doInBackground(Void... args) throws Throwable {
                        long start = System.currentTimeMillis();
                        Bitmap croppedBitmap = (Bitmap) bitmapRenderer.f();
                        File resultFile = FileUtils.getPhotoFile();
                        FileOutputStream fos = new FileOutputStream(resultFile);
                        try {
                            croppedBitmap.compress(Bitmap.CompressFormat.JPEG, 86, fos);
                        } catch (Exception e) {
                            Utils.closeSilently(fos);
                            resultFile = null;
                            L.e(e, new Object[0]);
                        }
                        long stop = System.currentTimeMillis();
                        if (stop - start < 500) {
                            Thread.sleep((500 - stop) + start);
                        }
                        return resultFile;
                    }

                    @Override // com.vk.attachpicker.util.AsyncTask
                    public void onPostExecute(File file) {
                        LoadingDialog.dismissLoadingDialog(this.progressDialog);
                        if (file != null) {
                            if (!isDefault && PreferenceManager.getDefaultSharedPreferences(Picker.getContext()).getBoolean("saveProcessedImage", true)) {
                                CameraUtils.addMediaToGallery(Picker.getContext(), file, null);
                            }
                            ((AttachResulter) activity).setResultAndFinish(SelectionContext.packSinglePhoto(file));
                            return;
                        }
                        Toast.makeText(activity, (int) R.string.picker_saving_error, 0).show();
                    }
                }.execPool(new Void[0]);
            }
        }
    }

    public /* synthetic */ Bitmap lambda$renderAndFinish$19() {
        int i = StoriesProcessor.MAX_PHOTO_WIDTH;
        GcTrigger.DEFAULT.runGc();
        ImageState imageState = this.imageState;
        if (Screen.realWidth() > 1080) {
            i = 1440;
        }
        Bitmap croppedBitmap = imageState.getCroppedBitmap(i);
        ApiFilterWrapper f = getCenterFilter();
        if (this.imageState.getAutoEnhanceValue() > 0.0f) {
            Native.enhanceBitmap(croppedBitmap, this.imageState.getAutoEnhanceValue());
        }
        if (!ApiFilterWrapper.FILTER_ORIGINAL.equals(getCenterFilter().id) && ApiColorPreference.getNonDefaultColorsCount(f.filter.colors, -1, false) > 0) {
            Bitmap lut = LutManager.getBigLookupBitmap(f);
            Native.lookupBitmap(croppedBitmap, lut);
            lut.recycle();
        }
        Canvas canvas = new Canvas(croppedBitmap);
        DrawingState ds = this.drawingView.getDrawingStateCopy();
        ds.handleSizeChange(croppedBitmap.getWidth(), croppedBitmap.getHeight());
        DrawingCanvas drawingCanvas = new DrawingCanvas(croppedBitmap.getWidth(), croppedBitmap.getHeight());
        drawingCanvas.draw(ds);
        drawingCanvas.drawOnCanvas(canvas);
        StickersDrawingState sds = this.stickersDrawingView.getDrawingState();
        sds.handleSizeChange(croppedBitmap.getWidth(), croppedBitmap.getHeight());
        sds.draw(canvas);
        return croppedBitmap;
    }

    @Override // com.vk.core.simplescreen.BaseScreen
    public void onResume() {
        super.onResume();
        if (!this.shouldPlayOpenAnimation) {
            loadImages();
        } else {
            this.container.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vk.attachpicker.screen.EditorScreen.9
                {
                    EditorScreen.this = this;
                }

                @Override // android.view.ViewTreeObserver.OnPreDrawListener
                public boolean onPreDraw() {
                    EditorScreen.this.container.getViewTreeObserver().removeOnPreDrawListener(this);
                    EditorScreen.this.openAnimation();
                    return false;
                }
            });
        }
    }

    @Override // com.vk.core.simplescreen.BaseScreen
    public void onPause() {
        super.onPause();
        if (this.imageEditor != null) {
            this.imageEditor.onPause();
        }
        this.editorContainer.removeAllViews();
    }

    @Override // com.vk.core.simplescreen.BaseScreen
    public void onDestroy() {
        super.onDestroy();
        if (this.currentTask != null) {
            this.currentTask.cancel();
            this.currentTask = null;
        }
        LutManager.clearCache();
    }

    @Override // com.vk.core.simplescreen.BaseScreen
    public void onTopPaddingChanged(int topPadding) {
        this.closeButtonContainer.setPadding(0, topPadding, 0, 0);
        if (this.stickersView != null) {
            this.stickersView.setTopPadding(topPadding);
        }
        this.topPadding = topPadding;
    }

    @Override // com.vk.core.simplescreen.BaseScreen
    public boolean onBackPressed() {
        if (this.controlsEnabled) {
            if (this.stickersView != null && this.stickersView.getVisibility() == 0) {
                hideStickers();
            } else if (this.currentTextDialog != null) {
                this.currentTextDialog.dismiss();
            } else if (isEnhancePanelVisible()) {
                cancelAutoEnhance();
            } else if (isDrawingPanelVisible()) {
                cancelDrawing();
            } else {
                finish();
            }
        }
        return true;
    }

    @Override // com.vk.core.simplescreen.BaseScreen
    public void finish() {
        DialogInterface.OnClickListener onClickListener;
        if ((this.drawingView != null && this.stickersDrawingView != null && this.imageState != null && this.imageState.getGeometryState() != null && !this.drawingView.isDefault()) || !this.stickersDrawingView.isDefault() || !isDefaultFilter() || this.imageState.getAutoEnhanceValue() != 0.0f || (this.imageState.getGeometryState() != null && !this.imageState.getGeometryState().isDefaultState())) {
            VKAlertDialog.Builder builder = new VKAlertDialog.Builder(getActivity());
            builder.setTitle(R.string.confirm);
            builder.setMessage(R.string.picker_editor_exit_confirm);
            builder.setPositiveButton(R.string.picker_yes, EditorScreen$$Lambda$21.lambdaFactory$(this));
            onClickListener = EditorScreen$$Lambda$22.instance;
            builder.setNegativeButton(R.string.picker_no, onClickListener);
            builder.show();
        } else if (this.delegate != null) {
            closeAnimation();
        } else {
            super.finish();
        }
    }

    public /* synthetic */ void lambda$finish$20(DialogInterface dialog, int which) {
        if (this.delegate != null) {
            closeAnimation();
        } else {
            super.finish();
        }
    }

    private boolean checkButtonLock() {
        if (this.buttonClickLock.isLocked()) {
            return true;
        }
        this.buttonClickLock.lock();
        return false;
    }

    private void cancelAutoEnhance() {
        this.tempAutoValue = this.imageState.getAutoEnhanceValue();
        if (this.imageEditor != null && this.imageEditor.getFilter() != null) {
            this.imageEditor.getFilter().setEnhanceIntensity(this.tempAutoValue);
        }
        bottomPanelCloseAnimation(this.autoPanel);
    }

    private void cancelDrawing() {
        this.drawingView.restoreState();
        setDrawingTouchEnabled(false);
        bottomPanelCloseAnimation(this.drawingPanel);
    }

    public void setControlsEnabled(boolean enabled) {
        this.controlsEnabled = enabled;
        this.closeButton.setEnabled(enabled);
        this.attachButton.setEnabled(enabled);
        this.actionSticker.setEnabled(enabled);
        this.actionText.setEnabled(enabled);
        this.actionDrawing.setEnabled(enabled);
        this.actionCrop.setEnabled(enabled);
        this.actionAuto.setEnabled(enabled);
    }

    public void setBackgroundBitmap(Bitmap bitmap) {
        this.backgroundView.setImageBitmap(bitmap);
    }

    public void initUi() {
        if (!isDestroyed()) {
            View progress = this.mainContainer.findViewById(R.id.cpv_progress);
            if (progress != null) {
                this.mainContainer.removeView(progress);
            }
            this.imageEditor = new SnapsterImageEditorView(getActivity());
            this.editorContainer.addView(this.imageEditor, new FrameLayout.LayoutParams(-1, -1));
            this.imageEditor.setImage(this.imageState.getCroppedBitmap());
            this.container.setAspectRatio(BitmapUtils.getAspectRatio(this.imageState.getCroppedBitmap()));
            setBackgroundBitmap(this.imageState.getCroppedBitmap());
            updateFilter();
            setControlsEnabled(true);
            showFiltersTooltip();
        }
    }

    public void updateFilter() {
        if (this.imageEditor != null) {
            AllInOneFilter filter = new AllInOneFilter(this.imageState.getAutoFixedBitmap(), getLeftFilter(), getCenterFilter(), getRightFilter());
            filter.setEnhanceIntensity(this.tempAutoValue);
            this.imageEditor.setFilter(EditorScreen$$Lambda$23.lambdaFactory$(filter));
        }
        this.layoutPagerPosition = this.pager.getCurrentItem();
    }

    public static /* synthetic */ AllInOneFilter lambda$updateFilter$22(AllInOneFilter filter) {
        return filter;
    }

    @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
    public void onGlobalLayout() {
    }

    private ApiFilterWrapper getLeftFilter() {
        int currentPositon = this.pager.getCurrentItem() % this.pagerAdapter.getRealCount();
        return currentPositon == 0 ? this.pagerAdapter.getFilterWrappers().get(this.pagerAdapter.getRealCount() - 1) : this.pagerAdapter.getFilterWrappers().get(currentPositon - 1);
    }

    private ApiFilterWrapper getCenterFilter() {
        int currentPositon = this.pager.getCurrentItem() % this.pagerAdapter.getRealCount();
        return this.pagerAdapter.getFilterWrappers().get(currentPositon);
    }

    private ApiFilterWrapper getRightFilter() {
        int currentPositon = this.pager.getCurrentItem() % this.pagerAdapter.getRealCount();
        return currentPositon == this.pagerAdapter.getRealCount() + (-1) ? this.pagerAdapter.getFilterWrappers().get(0) : this.pagerAdapter.getFilterWrappers().get(currentPositon + 1);
    }

    private boolean isDefaultFilter() {
        return ApiFilterWrapper.FILTER_ORIGINAL.equals(getCenterFilter().id);
    }

    public void loadImages() {
        if (this.currentTask == null || !this.currentTask.isRunning()) {
            this.currentTask = new AsyncTask<Void, Void, Void>() { // from class: com.vk.attachpicker.screen.EditorScreen.10
                {
                    EditorScreen.this = this;
                }

                @Override // com.vk.attachpicker.util.AsyncTask
                public Void doInBackground(Void... args) throws Throwable {
                    EditorScreen.this.imageState.getAutoFixedBitmap();
                    return null;
                }

                @Override // com.vk.attachpicker.util.AsyncTask
                public void onPostExecute(Void aVoid) {
                    EditorScreen.this.currentTask = null;
                    EditorScreen.this.initUi();
                }
            };
            this.currentTask.execPool(new Void[0]);
        }
    }

    private void setDrawingTouchEnabled(boolean enabled) {
        this.drawingView.setTouchEnabled(enabled);
        this.stickersDrawingView.setTouchEnabled(!enabled);
    }

    public void hideStickers() {
        if (this.stickersView != null && this.stickersView.getVisibility() != 8) {
            this.stickersView.animate().alpha(0.0f).setListener(new AnimatorListenerAdapter() { // from class: com.vk.attachpicker.screen.EditorScreen.11
                {
                    EditorScreen.this = this;
                }

                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animation) {
                    EditorScreen.this.stickersView.setVisibility(8);
                }
            }).setDuration(200L).start();
        }
    }

    public void onStickerClick() {
        Activity activity;
        hideTooltip();
        if (!checkButtonLock() && this.pagerState == 0 && (activity = getActivity()) != null) {
            if (this.stickersView == null) {
                this.stickersView = new EditorStickerView(activity, new AnonymousClass12(activity));
                this.stickersView.setTopPadding(this.closeButtonContainer.getPaddingTop());
                this.stickersView.setVisibility(8);
                this.screenView.addView(this.stickersView);
            }
            this.stickersView.setAlpha(0.0f);
            this.stickersView.setVisibility(0);
            this.stickersView.checkSelection();
            this.stickersView.animate().alpha(1.0f).setListener(null).setDuration(200L).start();
        }
    }

    /* renamed from: com.vk.attachpicker.screen.EditorScreen$12 */
    /* loaded from: classes2.dex */
    public class AnonymousClass12 implements EditorStickerView.Listener {
        final /* synthetic */ Activity val$activity;

        AnonymousClass12(Activity activity) {
            EditorScreen.this = this$0;
            this.val$activity = activity;
        }

        private void loadAndShow(String url, boolean emoji, String metaInfo) {
            Handler handler = new Handler(Looper.getMainLooper());
            AtomicReference<Dialog> dialog = new AtomicReference<>();
            Runnable dialogShow = EditorScreen$12$$Lambda$1.lambdaFactory$(dialog, this.val$activity);
            VKImageLoader.getBitmap(Uri.parse(url)).subscribeOn(Schedulers.io()).observeOn(AndroidSchedulers.mainThread()).subscribe(EditorScreen$12$$Lambda$2.lambdaFactory$(this, handler, dialogShow, dialog, emoji, metaInfo), EditorScreen$12$$Lambda$3.lambdaFactory$(this.val$activity));
        }

        public static /* synthetic */ void lambda$loadAndShow$0(AtomicReference dialog, Activity activity) {
            dialog.set(LoadingDialog.getInstance(activity, Integer.valueOf((int) R.string.picker_loading)));
            ((Dialog) dialog.get()).show();
        }

        public /* synthetic */ void lambda$loadAndShow$1(Handler handler, Runnable dialogShow, AtomicReference dialog, boolean emoji, String metaInfo, Bitmap bitmap) throws Exception {
            handler.removeCallbacks(dialogShow);
            LoadingDialog.dismissLoadingDialog((Dialog) dialog.get());
            EditorScreen.this.hideStickers();
            int maxWidth = Math.min(EditorScreen.this.stickersDrawingView.getMeasuredWidth(), EditorScreen.this.stickersDrawingView.getMeasuredHeight());
            if (emoji) {
                maxWidth /= 2;
            }
            EditorScreen.this.stickersDrawingView.addStickerView(new BitmapSticker(bitmap, maxWidth, metaInfo));
            EditorScreen.this.showStickerTooltip();
            if (emoji) {
                EditorScreen.this.trackEmoji(false);
            } else {
                EditorScreen.this.trackStickers(false);
            }
        }

        @Override // com.vk.attachpicker.stickers.EditorStickerView.Listener
        public void onStickerSelected(int packId, int stickerId, String url, String stickerReferrer) {
            new PhotosAddEditorRecentSticker(stickerId).exec();
            loadAndShow(url, false, packId + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + stickerId);
        }

        @Override // com.vk.attachpicker.stickers.EditorStickerView.Listener
        public void close() {
            EditorScreen.this.hideStickers();
        }

        @Override // com.vk.attachpicker.stickers.EditorStickerView.Listener
        public void onEmojiSelected(String emoji) {
            loadAndShow(emoji, true, null);
        }

        @Override // com.vk.attachpicker.stickers.EditorStickerView.Listener
        public void onMaskSelected(String path, int id) {
            loadAndShow(path, true, String.valueOf(id));
        }
    }

    public void onTextClick() {
        hideTooltip();
        if (!checkButtonLock() && this.pagerState == 0 && this.currentTextDialog == null) {
            this.closeButtonContainer.animate().alpha(0.0f).setDuration(200L).start();
            this.currentTextDialog = new TextStickerDialog(false, false, getActivity(), EditorScreen$$Lambda$24.lambdaFactory$(this));
            this.currentTextDialog.setOnDismissListener(EditorScreen$$Lambda$25.lambdaFactory$(this));
            this.currentTextDialog.show();
        }
    }

    public /* synthetic */ void lambda$onTextClick$23(String text, int color, StickerStyle typeface) {
        if (!TextUtils.isEmpty(text)) {
            this.stickersDrawingView.addStickerView(new TextSticker(this.stickersDrawingView.getMeasuredWidth() - Screen.dp(64), text, color, typeface));
            showTextTooltip();
            trackText(false);
        }
    }

    public /* synthetic */ void lambda$onTextClick$24(DialogInterface dialog) {
        this.closeButtonContainer.animate().alpha(1.0f).setDuration(200L).start();
        this.currentTextDialog = null;
    }

    public void onDrawingClick() {
        hideTooltip();
        if (!checkButtonLock() && this.pagerState == 0) {
            this.drawingUndo.setEnabled(this.drawingView.getHistorySize() > 0);
            this.drawingView.saveState();
            setDrawingTouchEnabled(true);
            bottomPanelOpenAnimation(this.drawingPanel, EditorScreen$$Lambda$26.lambdaFactory$(this));
        }
    }

    public /* synthetic */ void lambda$onDrawingClick$25() {
        setDrawingTouchEnabled(true);
    }

    public void onCropClick() {
        hideTooltip();
        if (!checkButtonLock() && this.pagerState == 0) {
            cropOpenAnimation(EditorScreen$$Lambda$27.lambdaFactory$(this));
        }
    }

    public /* synthetic */ void lambda$onCropClick$26() {
        if (isAdded()) {
            showScreen(new CropScreen(this.imageState, new CropScreen.Delegate() { // from class: com.vk.attachpicker.screen.EditorScreen.13
                {
                    EditorScreen.this = this;
                }

                @Override // com.vk.attachpicker.screen.CropScreen.Delegate
                public void onFixedAspectRatioChanged(CropAspectRatio aspectRatio) {
                    EditorScreen.this.currentCropAspectRatio = aspectRatio;
                }

                @Override // com.vk.attachpicker.screen.CropScreen.Delegate
                public void onCrop(Bitmap bitmap, Matrix cropMatrixBefore) {
                    RectF drawingRect = getDrawingRect(BitmapUtils.getAspectRatio(bitmap));
                    Matrix croppedBitmapMatrix = EditorScreen.this.imageState.getCroppedBitmapMatrix(drawingRect);
                    EditorScreen.this.drawingView.handleCrop(cropMatrixBefore, croppedBitmapMatrix);
                    EditorScreen.this.stickersDrawingView.handleCrop(cropMatrixBefore, croppedBitmapMatrix);
                    EditorScreen.this.drawingView.handleSizeChange((int) drawingRect.width(), (int) drawingRect.height());
                    EditorScreen.this.stickersDrawingView.handleSizeChange((int) drawingRect.width(), (int) drawingRect.height());
                    EditorScreen.this.container.setAspectRatio(EditorScreen.this.imageState.getCroppedBitmapAspectRatio());
                    EditorScreen.this.setBackgroundBitmap(bitmap);
                }

                @Override // com.vk.attachpicker.screen.CropScreen.Delegate
                public void startCropCloseAnimation(RectF crop) {
                    EditorScreen.this.cropCloseAnimation(crop);
                }

                @Override // com.vk.attachpicker.screen.CropScreen.Delegate
                public RectF getDrawingRect(float ar) {
                    return CropUtils.calculatePosition(ar, EditorScreen.this.mainContainer.getMeasuredWidth(), EditorScreen.this.mainContainer.getMeasuredHeight(), 0.0f, 0.0f, 0.0f, 0.0f);
                }
            }, this.currentCropAspectRatio));
        }
    }

    public void onAutoClick() {
        hideTooltip();
        if (!checkButtonLock() && this.pagerState == 0) {
            this.tempAutoValue = this.imageState.getAutoEnhanceValue();
            this.autoSeekBar.setValue(this.tempAutoValue);
            bottomPanelOpenAnimation(this.autoPanel, EditorScreen$$Lambda$28.lambdaFactory$(this));
        }
    }

    public /* synthetic */ void lambda$onAutoClick$28() {
        if (this.imageState.getAutoEnhanceValue() == 0.0f) {
            setControlsEnabled(false);
            ValueAnimator enhanceAnimation = ObjectAnimator.ofFloat(0.0f, 0.5f);
            enhanceAnimation.addUpdateListener(EditorScreen$$Lambda$38.lambdaFactory$(this));
            enhanceAnimation.addListener(new AnimatorListenerAdapter() { // from class: com.vk.attachpicker.screen.EditorScreen.14
                {
                    EditorScreen.this = this;
                }

                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animation) {
                    EditorScreen.this.setControlsEnabled(true);
                }
            });
            enhanceAnimation.setInterpolator(AnimationUtils.decelerateInterpolator);
            enhanceAnimation.setDuration(300L);
            enhanceAnimation.start();
        }
    }

    public /* synthetic */ void lambda$null$27(ValueAnimator animation) {
        float value = ((Float) animation.getAnimatedValue()).floatValue();
        this.autoSeekBar.setValue(value);
    }

    private boolean isEnhancePanelVisible() {
        return this.autoPanel.getVisibility() == 0;
    }

    private boolean isDrawingPanelVisible() {
        return this.drawingPanel.getVisibility() == 0;
    }

    public void openAnimation() {
        final Activity activity = getActivity();
        this.locker.lockOrientation(activity);
        setControlsEnabled(false);
        RectF editorRect = CropUtils.calculatePosition(this.container.getAspectRatio(), this.mainContainer.getMeasuredWidth(), this.mainContainer.getMeasuredHeight(), 0.0f, 0.0f, 0.0f, 0.0f);
        RectF viewerRect = CropUtils.calculatePosition(this.container.getAspectRatio(), this.mainContainer.getMeasuredWidth(), this.mainContainer.getMeasuredHeight() + Picker.getContext().getResources().getDimension(R.dimen.picker_image_editor_actions_height), 0.0f, 0.0f, 0.0f, 0.0f);
        float scaleBefore = viewerRect.width() / editorRect.width();
        float translationYBefore = viewerRect.top - editorRect.top;
        float translationXBefore = (-((this.mainContainer.getMeasuredWidth() * scaleBefore) - this.mainContainer.getMeasuredWidth())) / 2.0f;
        AnimatorSet set = new AnimatorSet();
        set.setInterpolator(AnimationUtils.decelerateInterpolator);
        this.closeButtonContainer.setAlpha(0.0f);
        this.mainContainer.setTranslationY(translationYBefore);
        this.mainContainer.setTranslationX(translationXBefore);
        this.mainContainer.setScaleX(scaleBefore);
        this.mainContainer.setScaleY(scaleBefore);
        this.actionsPanel.setTranslationY(this.actionsPanel.getHeight());
        this.bottomShadow.setTranslationY(this.actionsPanel.getHeight());
        set.playTogether(ObjectAnimator.ofFloat(this.closeButtonContainer, View.ALPHA, 0.0f, 1.0f), ObjectAnimator.ofFloat(this.mainContainer, View.TRANSLATION_X, translationXBefore, 0.0f), ObjectAnimator.ofFloat(this.mainContainer, View.TRANSLATION_Y, translationYBefore, 0.0f), ObjectAnimator.ofFloat(this.mainContainer, View.SCALE_X, scaleBefore, 1.0f), ObjectAnimator.ofFloat(this.mainContainer, View.SCALE_Y, scaleBefore, 1.0f), ObjectAnimator.ofFloat(this.actionsPanel, View.TRANSLATION_Y, this.actionsPanel.getHeight(), 0.0f), ObjectAnimator.ofFloat(this.bottomShadow, View.TRANSLATION_Y, this.actionsPanel.getHeight(), 0.0f));
        set.addListener(new AnimatorListenerAdapter() { // from class: com.vk.attachpicker.screen.EditorScreen.15
            {
                EditorScreen.this = this;
            }

            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                EditorScreen.this.loadImages();
                EditorScreen.this.locker.unlockOrientation(activity);
                EditorScreen.this.setControlsEnabled(true);
            }
        });
        set.setDuration(175L);
        set.setStartDelay(16L);
        set.start();
        this.shouldPlayOpenAnimation = false;
    }

    private void closeAnimation() {
        Activity activity = getActivity();
        this.locker.lockOrientation(activity);
        setControlsEnabled(false);
        if (this.imageState != null && this.imageState.getGeometryState() != null && !this.imageState.getGeometryState().isDefaultState()) {
            this.overlayContainer.setVisibility(8);
            this.container.setAspectRatio(BitmapUtils.getAspectRatio(this.imageState.getBigBitmap()));
            setBackgroundBitmap(this.imageState.getBigBitmap());
        }
        RectF editorRect = CropUtils.calculatePosition(this.container.getAspectRatio(), this.mainContainer.getMeasuredWidth(), this.mainContainer.getMeasuredHeight(), 0.0f, 0.0f, 0.0f, 0.0f);
        RectF viewerRect = CropUtils.calculatePosition(this.container.getAspectRatio(), this.mainContainer.getMeasuredWidth(), this.mainContainer.getMeasuredHeight() + Picker.getContext().getResources().getDimension(R.dimen.picker_image_editor_actions_height), 0.0f, 0.0f, 0.0f, 0.0f);
        float scaleBefore = viewerRect.width() / editorRect.width();
        float translationYBefore = viewerRect.top - editorRect.top;
        float translationXBefore = (-((this.mainContainer.getMeasuredWidth() * scaleBefore) - this.mainContainer.getMeasuredWidth())) / 2.0f;
        AnimatorSet set = new AnimatorSet();
        set.setInterpolator(AnimationUtils.accelerateInterpolator);
        set.playTogether(ObjectAnimator.ofFloat(this.closeButtonContainer, View.ALPHA, 1.0f, 0.0f), ObjectAnimator.ofFloat(this.overlayContainer, View.ALPHA, 1.0f, 0.0f), ObjectAnimator.ofFloat(this.mainContainer, View.TRANSLATION_X, 0.0f, translationXBefore), ObjectAnimator.ofFloat(this.mainContainer, View.TRANSLATION_Y, 0.0f, translationYBefore), ObjectAnimator.ofFloat(this.mainContainer, View.SCALE_X, 1.0f, scaleBefore), ObjectAnimator.ofFloat(this.mainContainer, View.SCALE_Y, 1.0f, scaleBefore), ObjectAnimator.ofFloat(this.actionsPanel, View.TRANSLATION_Y, 0.0f, this.actionsPanel.getHeight()), ObjectAnimator.ofFloat(this.bottomShadow, View.TRANSLATION_Y, 0.0f, this.actionsPanel.getHeight()));
        set.addListener(new AnimatorListenerAdapter() { // from class: com.vk.attachpicker.screen.EditorScreen.16
            {
                EditorScreen.this = this;
            }

            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                EditorScreen.super.finish();
                if (EditorScreen.this.delegate != null) {
                    EditorScreen.this.delegate.startEditorCloseAnimation();
                }
            }
        });
        set.setDuration(175L);
        set.start();
        this.shouldPlayOpenAnimation = false;
    }

    private void bottomPanelOpenAnimation(final View panel, final Runnable... runAfter) {
        final Activity activity = getActivity();
        this.locker.lockOrientation(activity);
        setControlsEnabled(false);
        final int h = (int) activity.getResources().getDimension(R.dimen.picker_image_editor_bottom_panel);
        this.actionsPanel.setTranslationY(0.0f);
        this.actionsPanel.setVisibility(0);
        this.closeButtonContainer.setVisibility(0);
        panel.setVisibility(8);
        AnimatorSet set1 = new AnimatorSet();
        set1.playTogether(ObjectAnimator.ofFloat(this.closeButtonContainer, View.ALPHA, 0.0f), ObjectAnimator.ofFloat(this.actionsPanel, View.TRANSLATION_Y, h), ObjectAnimator.ofFloat(this.bottomShadow, View.TRANSLATION_Y, h));
        set1.setInterpolator(AnimationUtils.accelerateInterpolator);
        set1.setDuration(175L);
        set1.addListener(new AnimatorListenerAdapter() { // from class: com.vk.attachpicker.screen.EditorScreen.17
            {
                EditorScreen.this = this;
            }

            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                EditorScreen.this.actionsPanel.setVisibility(8);
                EditorScreen.this.closeButtonContainer.setVisibility(8);
                panel.setTranslationY(h);
                panel.setVisibility(0);
            }
        });
        AnimatorSet set2 = new AnimatorSet();
        set2.playTogether(ObjectAnimator.ofFloat(panel, View.TRANSLATION_Y, panel.getLayoutParams().height, 0.0f), ObjectAnimator.ofFloat(this.bottomShadow, View.TRANSLATION_Y, h - panel.getLayoutParams().height));
        set2.setInterpolator(AnimationUtils.decelerateInterpolator);
        set2.setDuration(175L);
        AnimatorSet set = new AnimatorSet();
        set.playSequentially(set1, set2);
        set.addListener(new AnimatorListenerAdapter() { // from class: com.vk.attachpicker.screen.EditorScreen.18
            {
                EditorScreen.this = this;
            }

            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                Runnable[] runnableArr;
                EditorScreen.this.setControlsEnabled(true);
                for (Runnable r : runAfter) {
                    r.run();
                }
                EditorScreen.this.locker.unlockOrientation(activity);
            }
        });
        set.start();
    }

    private void bottomPanelCloseAnimation(final View panel) {
        final Activity activity = getActivity();
        this.locker.lockOrientation(activity);
        setControlsEnabled(false);
        final int h = (int) activity.getResources().getDimension(R.dimen.picker_image_editor_bottom_panel);
        panel.setTranslationY(0.0f);
        panel.setVisibility(0);
        this.closeButtonContainer.setVisibility(8);
        this.actionsPanel.setVisibility(8);
        this.closeButtonContainer.setAlpha(0.0f);
        AnimatorSet set1 = new AnimatorSet();
        set1.playTogether(ObjectAnimator.ofFloat(panel, View.TRANSLATION_Y, panel.getLayoutParams().height), ObjectAnimator.ofFloat(this.bottomShadow, View.TRANSLATION_Y, h));
        set1.addListener(new AnimatorListenerAdapter() { // from class: com.vk.attachpicker.screen.EditorScreen.19
            {
                EditorScreen.this = this;
            }

            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                panel.setVisibility(8);
                EditorScreen.this.closeButtonContainer.setVisibility(0);
                EditorScreen.this.closeButtonContainer.setAlpha(0.0f);
                EditorScreen.this.actionsPanel.setVisibility(0);
                EditorScreen.this.actionsPanel.setTranslationY(h);
            }
        });
        set1.setInterpolator(AnimationUtils.accelerateInterpolator);
        set1.setDuration(175L);
        AnimatorSet set2 = new AnimatorSet();
        set2.playTogether(ObjectAnimator.ofFloat(this.closeButtonContainer, View.ALPHA, 1.0f), ObjectAnimator.ofFloat(this.actionsPanel, View.TRANSLATION_Y, 0.0f), ObjectAnimator.ofFloat(this.bottomShadow, View.TRANSLATION_Y, 0.0f));
        set2.setInterpolator(AnimationUtils.decelerateInterpolator);
        set2.setDuration(175L);
        AnimatorSet set = new AnimatorSet();
        set.playSequentially(set1, set2);
        set.addListener(new AnimatorListenerAdapter() { // from class: com.vk.attachpicker.screen.EditorScreen.20
            {
                EditorScreen.this = this;
            }

            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                EditorScreen.this.autoSeekBar.setValue(EditorScreen.this.tempAutoValue);
                EditorScreen.this.setControlsEnabled(true);
                EditorScreen.this.locker.unlockOrientation(activity);
            }
        });
        set.start();
    }

    private void cropOpenAnimation(final Runnable onEnd) {
        this.locker.lockOrientation(getActivity());
        setControlsEnabled(false);
        float ar = this.container.getAspectRatio();
        RectF cropRect = CropUtils.calculatePosition(ar, this.mainContainer.getMeasuredWidth(), this.mainContainer.getMeasuredHeight(), RectCropOverlayView.SIDE_PADDING, this.closeButtonContainer.getPaddingTop() + RectCropOverlayView.SIDE_PADDING, RectCropOverlayView.SIDE_PADDING, RectCropOverlayView.SIDE_PADDING);
        float scale = cropRect.width() / this.container.getMeasuredWidth();
        AnimatorSet set = new AnimatorSet();
        set.playTogether(ObjectAnimator.ofFloat(this.overlayContainer, View.ALPHA, 0.0f), ObjectAnimator.ofFloat(this.container, View.SCALE_X, scale), ObjectAnimator.ofFloat(this.container, View.SCALE_Y, scale), ObjectAnimator.ofFloat(this.container, View.TRANSLATION_Y, cropRect.top - this.container.getTop()), ObjectAnimator.ofFloat(this.container, View.TRANSLATION_X, cropRect.left - this.container.getLeft()), ObjectAnimator.ofFloat(this.closeButtonContainer, View.ALPHA, 0.0f), ObjectAnimator.ofFloat(this.actionsPanel, View.TRANSLATION_Y, this.actionsPanel.getHeight()), ObjectAnimator.ofFloat(this.bottomShadow, View.TRANSLATION_Y, this.actionsPanel.getHeight()), AnimationUtils.ofArgb(this.screenView, BgColorFrameLayout.BACKGROUND_COLOR, this.cropBgColor));
        set.setInterpolator(AnimationUtils.accelerateInterpolator);
        set.setDuration(175L);
        set.addListener(new AnimatorListenerAdapter() { // from class: com.vk.attachpicker.screen.EditorScreen.21
            {
                EditorScreen.this = this;
            }

            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                Picker.run(onEnd);
                EditorScreen.this.setControlsEnabled(true);
            }
        });
        set.start();
    }

    public void cropCloseAnimation(RectF cropRect) {
        Activity activity = getActivity();
        setControlsEnabled(false);
        Utils.runOnPreDraw(this.container, EditorScreen$$Lambda$29.lambdaFactory$(this, cropRect, activity));
    }

    public /* synthetic */ void lambda$cropCloseAnimation$29(RectF cropRect, final Activity activity) {
        float ar = this.container.getAspectRatio();
        RectF editorRect = CropUtils.calculatePosition(ar, this.mainContainer.getMeasuredWidth(), this.mainContainer.getMeasuredHeight(), 0.0f, 0.0f, 0.0f, 0.0f);
        float scale = cropRect.width() / editorRect.width();
        this.container.setTranslationX(cropRect.left - editorRect.left);
        this.container.setTranslationY(cropRect.top - editorRect.top);
        this.container.setScaleX(scale);
        this.container.setScaleY(scale);
        AnimatorSet set = new AnimatorSet();
        set.playTogether(AnimationUtils.accelerate(ObjectAnimator.ofFloat(this.overlayContainer, View.ALPHA, 1.0f)), AnimationUtils.accelerate(ObjectAnimator.ofFloat(this.container, View.SCALE_X, 1.0f)), AnimationUtils.accelerate(ObjectAnimator.ofFloat(this.container, View.SCALE_Y, 1.0f)), AnimationUtils.accelerate(ObjectAnimator.ofFloat(this.container, View.TRANSLATION_Y, 0.0f)), AnimationUtils.accelerate(ObjectAnimator.ofFloat(this.container, View.TRANSLATION_X, 0.0f)), AnimationUtils.accelerate(ObjectAnimator.ofFloat(this.closeButtonContainer, View.ALPHA, 1.0f)), AnimationUtils.accelerate(AnimationUtils.ofArgb(this.screenView, BgColorFrameLayout.BACKGROUND_COLOR, this.editorBgColor)), AnimationUtils.decelerate2(ObjectAnimator.ofFloat(this.actionsPanel, View.TRANSLATION_Y, 0.0f)), AnimationUtils.decelerate2(ObjectAnimator.ofFloat(this.bottomShadow, View.TRANSLATION_Y, 0.0f)));
        set.setDuration(175L);
        set.addListener(new AnimatorListenerAdapter() { // from class: com.vk.attachpicker.screen.EditorScreen.22
            {
                EditorScreen.this = this;
            }

            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                EditorScreen.this.locker.unlockOrientation(activity);
                EditorScreen.this.setControlsEnabled(true);
            }
        });
        set.start();
    }

    /* loaded from: classes2.dex */
    public class FiltersAdapter extends ViewPagerAdapter {
        public final int FAKE_COUNT = 1000;
        private final ArrayList<ApiFilterWrapper> filterWrappers = new ArrayList<>();

        public FiltersAdapter(ArrayList<ApiFilterWrapper> filterWrappers) {
            EditorScreen.this = r6;
            ApiFilterWrapper original = new ApiFilterWrapper(ApiFilterWrapper.FILTER_ORIGINAL, r6.getResources().getString(R.string.picker_original), new ApiFilter(), 2);
            this.filterWrappers.add(original);
            this.filterWrappers.addAll(filterWrappers);
        }

        public ArrayList<ApiFilterWrapper> getFilterWrappers() {
            return this.filterWrappers;
        }

        @Override // com.vk.attachpicker.widget.ViewPagerAdapter
        public View getView(int position, ViewPager pager) {
            return new View(EditorScreen.this.getActivity());
        }

        @Override // android.support.v4.view.PagerAdapter
        public int getCount() {
            return 1000;
        }

        public int getRealCount() {
            return this.filterWrappers.size();
        }
    }

    public final <T extends View> T $(@IdRes int id) {
        return (T) this.screenView.findViewById(id);
    }

    public final <T extends View> T $(@IdRes int id, Runnable action) {
        T view = (T) this.screenView.findViewById(id);
        view.setOnClickListener(EditorScreen$$Lambda$30.lambdaFactory$(action));
        return view;
    }

    public void trackStickers(boolean isFinal) {
        Picker.runDelayed(EditorScreen$$Lambda$31.lambdaFactory$(this, isFinal), 100L);
    }

    public /* synthetic */ void lambda$trackStickers$31(boolean isFinal) {
        ArrayList<String> stickerIds = new ArrayList<>();
        ArrayList<Sticker> stickers = this.stickersDrawingView.getDrawingState().getStickers();
        Iterator<Sticker> it = stickers.iterator();
        while (it.hasNext()) {
            Sticker s = it.next();
            if (s instanceof BitmapSticker) {
                BitmapSticker bs = (BitmapSticker) s;
                if (bs.getMetaInfo() != null) {
                    stickerIds.add(bs.getMetaInfo());
                }
            }
        }
        if (stickerIds.size() > 0) {
            this.editorStatistics.logStickers(stickerIds, isFinal);
        }
    }

    public void trackEmoji(boolean isFinal) {
        Picker.runDelayed(EditorScreen$$Lambda$32.lambdaFactory$(this, isFinal), 100L);
    }

    public /* synthetic */ void lambda$trackEmoji$32(boolean isFinal) {
        ArrayList<Sticker> stickers = this.stickersDrawingView.getDrawingState().getStickers();
        Iterator<Sticker> it = stickers.iterator();
        while (it.hasNext()) {
            Sticker s = it.next();
            if (s instanceof BitmapSticker) {
                BitmapSticker bs = (BitmapSticker) s;
                if (bs.getMetaInfo() == null) {
                    this.editorStatistics.logEmoji(isFinal);
                    return;
                }
            }
        }
    }

    private void trackText(boolean isFinal) {
        Picker.runDelayed(EditorScreen$$Lambda$33.lambdaFactory$(this, isFinal), 100L);
    }

    public /* synthetic */ void lambda$trackText$33(boolean isFinal) {
        ArrayList<Sticker> stickers = this.stickersDrawingView.getDrawingState().getStickers();
        Iterator<Sticker> it = stickers.iterator();
        while (it.hasNext()) {
            Sticker s = it.next();
            if (s instanceof TextSticker) {
                this.editorStatistics.logText(isFinal);
            }
        }
    }

    private void trackCrop() {
        Picker.runDelayed(EditorScreen$$Lambda$34.lambdaFactory$(this), 100L);
    }

    public /* synthetic */ void lambda$trackCrop$34() {
        this.editorStatistics.logCrop(true);
    }

    public void trackFilter(boolean isFinal) {
        Picker.runDelayed(EditorScreen$$Lambda$35.lambdaFactory$(this, isFinal), 100L);
    }

    public /* synthetic */ void lambda$trackFilter$35(boolean isFinal) {
        this.editorStatistics.logFilter(isFinal);
    }

    private void trackEnhance(boolean isFinal) {
        Picker.runDelayed(EditorScreen$$Lambda$36.lambdaFactory$(this, isFinal), 100L);
    }

    public /* synthetic */ void lambda$trackEnhance$36(boolean isFinal) {
        this.editorStatistics.logEnhance(isFinal);
    }

    private void trackDraw(boolean isFinal) {
        Picker.runDelayed(EditorScreen$$Lambda$37.lambdaFactory$(this, isFinal), 100L);
    }

    public /* synthetic */ void lambda$trackDraw$37(boolean isFinal) {
        this.editorStatistics.logDraw(isFinal);
    }
}
