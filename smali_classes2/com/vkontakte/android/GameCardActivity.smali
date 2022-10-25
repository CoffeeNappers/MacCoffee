.class public Lcom/vkontakte/android/GameCardActivity;
.super Lcom/vkontakte/android/VKActivity;
.source "GameCardActivity.java"

# interfaces
.implements Lcom/vkontakte/android/fragments/GameCardFragment$IOnListViewCreated;
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;
.implements Lcom/vkontakte/android/ui/widget/SlidingUpPanelLayout$PanelSlideListener;
.implements Lcom/vkontakte/android/ui/ResulterProvider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/GameCardActivity$Adapter;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final KEY_APPLICATIONS:Ljava/lang/String; = "key_applications"

.field private static final KEY_CATALOG_INFO:Ljava/lang/String; = "key_catalog_info"

.field private static final KEY_CURRENT_APPLICATION_INDEX:Ljava/lang/String; = "key_current_application_index"

.field private static final KEY_FROM_NOTIFICATION:Ljava/lang/String; = "key_from_notification"

.field private static final KEY_TITLE:Ljava/lang/String; = "key_title"

.field private static final MAX_APPLICATIONS_IN_BUNDLE:I = 0x64

.field private static bufferApiApplications:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/ApiApplication;",
            ">;"
        }
    .end annotation
.end field

.field static lastTime:J


# instance fields
.field private apiApplications:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/ApiApplication;",
            ">;"
        }
    .end annotation
.end field

.field private catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private catalogLoader:Lcom/vkontakte/android/api/apps/CatalogLoader;

.field private currentIndex:I

.field private headerBlock:Landroid/view/View;

.field private mResulters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/ui/ActivityResulter;",
            ">;"
        }
    .end annotation
.end field

.field private openActionMenu:Landroid/view/View;

.field private pageIndicator:Lcom/vkontakte/android/ui/widget/PageIndicator;

.field private pageTitle:Landroid/widget/TextView;

.field private slidingLayout:Lcom/vkontakte/android/ui/widget/SlidingUpPanelLayout;

.field private title:Ljava/lang/String;

.field private viewPager:Landroid/support/v4/view/ViewPager;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 45
    const-class v0, Lcom/vkontakte/android/GameCardActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/vkontakte/android/GameCardActivity;->$assertionsDisabled:Z

    .line 49
    const/4 v0, 0x0

    sput-object v0, Lcom/vkontakte/android/GameCardActivity;->bufferApiApplications:Ljava/util/ArrayList;

    .line 398
    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/vkontakte/android/GameCardActivity;->lastTime:J

    return-void

    .line 45
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 45
    invoke-direct {p0}, Lcom/vkontakte/android/VKActivity;-><init>()V

    .line 68
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/GameCardActivity;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/GameCardActivity;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/GameCardActivity;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/GameCardActivity;->apiApplications:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$002(Lcom/vkontakte/android/GameCardActivity;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/GameCardActivity;
    .param p1, "x1"    # Ljava/util/ArrayList;

    .prologue
    .line 45
    iput-object p1, p0, Lcom/vkontakte/android/GameCardActivity;->apiApplications:Ljava/util/ArrayList;

    return-object p1
.end method

.method static synthetic access$100(Lcom/vkontakte/android/GameCardActivity;)Landroid/support/v4/view/ViewPager;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/GameCardActivity;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/GameCardActivity;->viewPager:Landroid/support/v4/view/ViewPager;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/GameCardActivity;Ljava/util/ArrayList;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/GameCardActivity;
    .param p1, "x1"    # Ljava/util/ArrayList;

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lcom/vkontakte/android/GameCardActivity;->syncGui(Ljava/util/ArrayList;)V

    return-void
.end method

.method static synthetic access$300(Lcom/vkontakte/android/GameCardActivity;)Lcom/vkontakte/android/ui/widget/SlidingUpPanelLayout;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/GameCardActivity;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/GameCardActivity;->slidingLayout:Lcom/vkontakte/android/ui/widget/SlidingUpPanelLayout;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/GameCardActivity;)Lcom/vkontakte/android/data/CatalogInfo;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/GameCardActivity;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/GameCardActivity;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    return-object v0
.end method

.method static synthetic access$502(Lcom/vkontakte/android/GameCardActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/GameCardActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 45
    iput-object p1, p0, Lcom/vkontakte/android/GameCardActivity;->title:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$600(Lcom/vkontakte/android/GameCardActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/GameCardActivity;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/GameCardActivity;->pageTitle:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$700(Lcom/vkontakte/android/GameCardActivity;)Lcom/vkontakte/android/ui/widget/PageIndicator;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/GameCardActivity;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/GameCardActivity;->pageIndicator:Lcom/vkontakte/android/ui/widget/PageIndicator;

    return-object v0
.end method

.method private doRemoveApp()V
    .locals 3

    .prologue
    .line 291
    new-instance v1, Lcom/vkontakte/android/api/apps/AppsRemove;

    iget-object v0, p0, Lcom/vkontakte/android/GameCardActivity;->apiApplications:Ljava/util/ArrayList;

    iget v2, p0, Lcom/vkontakte/android/GameCardActivity;->currentIndex:I

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/ApiApplication;

    iget v0, v0, Lcom/vkontakte/android/data/ApiApplication;->id:I

    invoke-direct {v1, v0}, Lcom/vkontakte/android/api/apps/AppsRemove;-><init>(I)V

    new-instance v0, Lcom/vkontakte/android/GameCardActivity$4;

    invoke-direct {v0, p0, p0}, Lcom/vkontakte/android/GameCardActivity$4;-><init>(Lcom/vkontakte/android/GameCardActivity;Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/api/apps/AppsRemove;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 296
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 297
    return-void
.end method

.method private getActionBarHeight()I
    .locals 4

    .prologue
    .line 188
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 189
    .local v0, "tv":Landroid/util/TypedValue;
    invoke-virtual {p0}, Lcom/vkontakte/android/GameCardActivity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const v2, 0x10102eb

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 190
    iget v1, v0, Landroid/util/TypedValue;->data:I

    invoke-virtual {p0}, Lcom/vkontakte/android/GameCardActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/TypedValue;->complexToDimensionPixelSize(ILandroid/util/DisplayMetrics;)I

    move-result v1

    .line 192
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private initValues(Landroid/os/Bundle;)I
    .locals 10
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 114
    const-string/jumbo v6, "key_current_application_index"

    invoke-virtual {p1, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v4

    .line 115
    .local v4, "index":I
    const-string/jumbo v6, "key_applications"

    invoke-virtual {p1, v6}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v5

    .line 116
    .local v5, "parcelables":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/os/Parcelable;>;"
    const-string/jumbo v6, "key_catalog_info"

    invoke-virtual {p1, v6}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/data/CatalogInfo;

    iput-object v6, p0, Lcom/vkontakte/android/GameCardActivity;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    .line 117
    const-string/jumbo v6, "key_title"

    invoke-virtual {p1, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/vkontakte/android/GameCardActivity;->title:Ljava/lang/String;

    .line 119
    sget-boolean v6, Lcom/vkontakte/android/GameCardActivity;->$assertionsDisabled:Z

    if-nez v6, :cond_0

    if-nez v5, :cond_0

    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6}, Ljava/lang/AssertionError;-><init>()V

    throw v6

    .line 121
    :cond_0
    sget-object v6, Lcom/vkontakte/android/GameCardActivity;->bufferApiApplications:Ljava/util/ArrayList;

    if-eqz v6, :cond_1

    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 122
    sget-object v6, Lcom/vkontakte/android/GameCardActivity;->bufferApiApplications:Ljava/util/ArrayList;

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 123
    const/4 v6, 0x0

    sput-object v6, Lcom/vkontakte/android/GameCardActivity;->bufferApiApplications:Ljava/util/ArrayList;

    .line 126
    :cond_1
    new-instance v6, Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v7

    invoke-direct {v6, v7}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v6, p0, Lcom/vkontakte/android/GameCardActivity;->apiApplications:Ljava/util/ArrayList;

    .line 128
    if-ltz v4, :cond_3

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v4, v6, :cond_3

    move v2, v4

    .line 129
    .local v2, "currentIndex":I
    :goto_0
    const/4 v1, 0x0

    .line 130
    .local v1, "countOfHtml5GamesBeforeCurrentIndex":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v3, v6, :cond_5

    .line 131
    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/ApiApplication;

    .line 133
    .local v0, "a":Lcom/vkontakte/android/data/ApiApplication;
    iget-boolean v6, v0, Lcom/vkontakte/android/data/ApiApplication;->isHtml5App:Z

    if-nez v6, :cond_4

    .line 134
    iget-object v6, p0, Lcom/vkontakte/android/GameCardActivity;->apiApplications:Ljava/util/ArrayList;

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 130
    :cond_2
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 128
    .end local v0    # "a":Lcom/vkontakte/android/data/ApiApplication;
    .end local v1    # "countOfHtml5GamesBeforeCurrentIndex":I
    .end local v2    # "currentIndex":I
    .end local v3    # "i":I
    :cond_3
    const/4 v2, 0x0

    goto :goto_0

    .line 136
    .restart local v0    # "a":Lcom/vkontakte/android/data/ApiApplication;
    .restart local v1    # "countOfHtml5GamesBeforeCurrentIndex":I
    .restart local v2    # "currentIndex":I
    .restart local v3    # "i":I
    :cond_4
    if-ge v3, v2, :cond_2

    .line 138
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 142
    .end local v0    # "a":Lcom/vkontakte/android/data/ApiApplication;
    :cond_5
    sub-int/2addr v2, v1

    .line 144
    iget-object v6, p0, Lcom/vkontakte/android/GameCardActivity;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    if-eqz v6, :cond_7

    .line 145
    iget-object v6, p0, Lcom/vkontakte/android/GameCardActivity;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    iget-object v6, v6, Lcom/vkontakte/android/data/CatalogInfo;->title:Ljava/lang/String;

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_a

    .line 146
    iget-object v6, p0, Lcom/vkontakte/android/GameCardActivity;->pageTitle:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/vkontakte/android/GameCardActivity;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    iget-object v7, v7, Lcom/vkontakte/android/data/CatalogInfo;->title:Ljava/lang/String;

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 151
    :cond_6
    :goto_3
    new-instance v6, Lcom/vkontakte/android/GameCardActivity$1;

    iget-object v7, p0, Lcom/vkontakte/android/GameCardActivity;->apiApplications:Ljava/util/ArrayList;

    iget-object v8, p0, Lcom/vkontakte/android/GameCardActivity;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    const/4 v9, 0x1

    invoke-direct {v6, p0, v7, v8, v9}, Lcom/vkontakte/android/GameCardActivity$1;-><init>(Lcom/vkontakte/android/GameCardActivity;Ljava/util/ArrayList;Lcom/vkontakte/android/data/CatalogInfo;Z)V

    iput-object v6, p0, Lcom/vkontakte/android/GameCardActivity;->catalogLoader:Lcom/vkontakte/android/api/apps/CatalogLoader;

    .line 160
    :cond_7
    iget-object v6, p0, Lcom/vkontakte/android/GameCardActivity;->title:Ljava/lang/String;

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_8

    .line 161
    iget-object v6, p0, Lcom/vkontakte/android/GameCardActivity;->pageTitle:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/vkontakte/android/GameCardActivity;->title:Ljava/lang/String;

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 164
    :cond_8
    iget-object v6, p0, Lcom/vkontakte/android/GameCardActivity;->apiApplications:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-nez v6, :cond_9

    .line 165
    iget-object v6, p0, Lcom/vkontakte/android/GameCardActivity;->catalogLoader:Lcom/vkontakte/android/api/apps/CatalogLoader;

    invoke-virtual {v6}, Lcom/vkontakte/android/api/apps/CatalogLoader;->forceLoadNextPage()Z

    .line 168
    :cond_9
    iget-object v6, p0, Lcom/vkontakte/android/GameCardActivity;->pageIndicator:Lcom/vkontakte/android/ui/widget/PageIndicator;

    iget-object v7, p0, Lcom/vkontakte/android/GameCardActivity;->apiApplications:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/ui/widget/PageIndicator;->setCountOfPages(I)V

    .line 169
    iget-object v6, p0, Lcom/vkontakte/android/GameCardActivity;->viewPager:Landroid/support/v4/view/ViewPager;

    new-instance v7, Lcom/vkontakte/android/GameCardActivity$Adapter;

    invoke-direct {v7, p0}, Lcom/vkontakte/android/GameCardActivity$Adapter;-><init>(Lcom/vkontakte/android/GameCardActivity;)V

    invoke-virtual {v6, v7}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 170
    iget-object v6, p0, Lcom/vkontakte/android/GameCardActivity;->viewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v6, v2}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    .line 172
    iget-object v6, p0, Lcom/vkontakte/android/GameCardActivity;->apiApplications:Ljava/util/ArrayList;

    invoke-direct {p0, v6}, Lcom/vkontakte/android/GameCardActivity;->syncGui(Ljava/util/ArrayList;)V

    .line 174
    return v2

    .line 147
    :cond_a
    iget-object v6, p0, Lcom/vkontakte/android/GameCardActivity;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    iget v6, v6, Lcom/vkontakte/android/data/CatalogInfo;->titleRes:I

    if-lez v6, :cond_6

    .line 148
    iget-object v6, p0, Lcom/vkontakte/android/GameCardActivity;->pageTitle:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/vkontakte/android/GameCardActivity;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    iget v7, v7, Lcom/vkontakte/android/data/CatalogInfo;->titleRes:I

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(I)V

    goto :goto_3
.end method

.method public static openApp(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "visitSource"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "clickSource"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "appId"    # I

    .prologue
    .line 324
    new-instance v0, Lcom/vkontakte/android/data/ApiApplication;

    invoke-direct {v0}, Lcom/vkontakte/android/data/ApiApplication;-><init>()V

    .line 325
    .local v0, "application":Lcom/vkontakte/android/data/ApiApplication;
    iput p3, v0, Lcom/vkontakte/android/data/ApiApplication;->id:I

    .line 326
    invoke-static {p0, p1, p2, v0}, Lcom/vkontakte/android/GameCardActivity;->openApp(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/vkontakte/android/data/ApiApplication;)V

    .line 327
    return-void
.end method

.method public static openApp(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/vkontakte/android/data/ApiApplication;)V
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "visitSource"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "clickSource"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "app"    # Lcom/vkontakte/android/data/ApiApplication;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 333
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 334
    .local v0, "apiApplications":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/ApiApplication;>;"
    invoke-virtual {v0, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 335
    const/4 v1, 0x0

    invoke-static {p0, p1, p2, v0, v1}, Lcom/vkontakte/android/GameCardActivity;->openApp(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;I)V

    .line 336
    return-void
.end method

.method public static openApp(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/vkontakte/android/data/CatalogInfo;)V
    .locals 6
    .param p0, "ctx"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "visitSource"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "clickSource"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "catalogInfo"    # Lcom/vkontakte/android/data/CatalogInfo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 357
    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Lcom/vkontakte/android/GameCardActivity;->openApp(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;ILcom/vkontakte/android/data/CatalogInfo;)V

    .line 358
    return-void
.end method

.method public static openApp(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;I)V
    .locals 7
    .param p0, "ctx"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "visitSource"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "clickSource"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "currentIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/ApiApplication;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 343
    .local p3, "applications":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/ApiApplication;>;"
    const/4 v5, 0x0

    .line 344
    .local v5, "catalogInfo":Lcom/vkontakte/android/data/CatalogInfo;
    invoke-virtual {p3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/data/ApiApplication;

    .line 345
    .local v6, "application":Lcom/vkontakte/android/data/ApiApplication;
    iget-object v1, v6, Lcom/vkontakte/android/data/ApiApplication;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    if-eqz v1, :cond_0

    .line 346
    iget-object v5, v6, Lcom/vkontakte/android/data/ApiApplication;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    .end local v6    # "application":Lcom/vkontakte/android/data/ApiApplication;
    :cond_1
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    .line 350
    invoke-static/range {v0 .. v5}, Lcom/vkontakte/android/GameCardActivity;->openApp(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;ILcom/vkontakte/android/data/CatalogInfo;)V

    .line 351
    return-void
.end method

.method private static openApp(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;ILcom/vkontakte/android/data/CatalogInfo;)V
    .locals 6
    .param p0, "ctx"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "visitSource"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "clickSource"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "currentIndex"    # I
    .param p5, "catalogInfo"    # Lcom/vkontakte/android/data/CatalogInfo;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/ApiApplication;",
            ">;I",
            "Lcom/vkontakte/android/data/CatalogInfo;",
            ")V"
        }
    .end annotation

    .prologue
    .line 366
    .local p3, "applications":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/ApiApplication;>;"
    invoke-virtual {p3, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/data/ApiApplication;

    iget-boolean v2, v2, Lcom/vkontakte/android/data/ApiApplication;->isHtml5App:Z

    if-eqz v2, :cond_1

    .line 367
    invoke-virtual {p3, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/data/ApiApplication;

    const/4 v3, 0x0

    invoke-static {v2, v3, p0, p1, p2}, Lcom/vkontakte/android/data/Games;->openHtml5Game(Lcom/vkontakte/android/data/ApiApplication;Landroid/os/Bundle;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 396
    :cond_0
    :goto_0
    return-void

    .line 370
    :cond_1
    if-nez p3, :cond_2

    new-instance p3, Ljava/util/ArrayList;

    .end local p3    # "applications":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/ApiApplication;>;"
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 371
    .restart local p3    # "applications":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/ApiApplication;>;"
    :cond_2
    if-eqz p5, :cond_3

    iget-object v2, p5, Lcom/vkontakte/android/data/CatalogInfo;->filterType:Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    sget-object v3, Lcom/vkontakte/android/data/CatalogInfo$FilterType;->installed:Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    if-ne v2, v3, :cond_3

    .line 372
    invoke-virtual {p3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/ApiApplication;

    .line 373
    .local v0, "application":Lcom/vkontakte/android/data/ApiApplication;
    const/4 v3, 0x1

    iput-boolean v3, v0, Lcom/vkontakte/android/data/ApiApplication;->installed:Z

    goto :goto_1

    .line 377
    .end local v0    # "application":Lcom/vkontakte/android/data/ApiApplication;
    :cond_3
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/vkontakte/android/GameCardActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 378
    .local v1, "intent":Landroid/content/Intent;
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/16 v3, 0x64

    if-ge v2, v3, :cond_4

    .line 379
    const-string/jumbo v2, "key_applications"

    invoke-virtual {v1, v2, p3}, Landroid/content/Intent;->putParcelableArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 384
    :goto_2
    const-string/jumbo v2, "key_current_application_index"

    invoke-virtual {v1, v2, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 385
    const-string/jumbo v2, "key_catalog_info"

    invoke-virtual {v1, v2, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 386
    const/high16 v2, 0x10000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 388
    const-string/jumbo v2, "visitSource"

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 389
    const-string/jumbo v2, "clickSource"

    invoke-virtual {v1, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 391
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sget-wide v4, Lcom/vkontakte/android/GameCardActivity;->lastTime:J

    sub-long/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    move-result-wide v2

    const-wide/16 v4, 0x190

    cmp-long v2, v2, v4

    if-lez v2, :cond_0

    .line 392
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sput-wide v2, Lcom/vkontakte/android/GameCardActivity;->lastTime:J

    .line 393
    invoke-virtual {p0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 381
    :cond_4
    const-string/jumbo v2, "key_applications"

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putParcelableArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 382
    sput-object p3, Lcom/vkontakte/android/GameCardActivity;->bufferApiApplications:Ljava/util/ArrayList;

    goto :goto_2
.end method

.method private syncGui(Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/ApiApplication;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "allData":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/ApiApplication;>;"
    const/4 v2, 0x1

    .line 178
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_1

    .line 179
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/GameCardActivity;->pageIndicator:Lcom/vkontakte/android/ui/widget/PageIndicator;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/widget/PageIndicator;->setVisibility(I)V

    .line 180
    iget-object v0, p0, Lcom/vkontakte/android/GameCardActivity;->pageTitle:Landroid/widget/TextView;

    const/high16 v1, 0x41a00000    # 20.0f

    invoke-virtual {v0, v2, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 185
    :goto_0
    return-void

    .line 182
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/GameCardActivity;->pageIndicator:Lcom/vkontakte/android/ui/widget/PageIndicator;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/widget/PageIndicator;->setVisibility(I)V

    .line 183
    iget-object v0, p0, Lcom/vkontakte/android/GameCardActivity;->pageTitle:Landroid/widget/TextView;

    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {v0, v2, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    goto :goto_0
.end method


# virtual methods
.method public finish()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 301
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->finish()V

    .line 302
    invoke-virtual {p0, v0, v0}, Lcom/vkontakte/android/GameCardActivity;->overridePendingTransition(II)V

    .line 303
    return-void
.end method

.method public finish(Landroid/view/View;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 266
    invoke-virtual {p0}, Lcom/vkontakte/android/GameCardActivity;->onBackPressed()V

    .line 267
    return-void
.end method

.method protected getSource()Ljava/lang/String;
    .locals 3

    .prologue
    .line 315
    invoke-virtual {p0}, Lcom/vkontakte/android/GameCardActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "key_from_notification"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "push"

    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, "direct"

    goto :goto_0
.end method

.method synthetic lambda$null$0(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 282
    invoke-direct {p0}, Lcom/vkontakte/android/GameCardActivity;->doRemoveApp()V

    .line 283
    return-void
.end method

.method synthetic lambda$openActionMenu$1(Landroid/view/MenuItem;)Z
    .locals 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 277
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f080176

    .line 278
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0800d1

    .line 279
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080433

    const/4 v2, 0x0

    .line 280
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080798

    invoke-static {p0}, Lcom/vkontakte/android/GameCardActivity$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/GameCardActivity;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    .line 281
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 284
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 285
    const/4 v0, 0x1

    return v0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 75
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/VKActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 76
    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->mResulters:Ljava/util/List;

    if-eqz v1, :cond_0

    .line 77
    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->mResulters:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/ActivityResulter;

    .line 78
    .local v0, "resulter":Lcom/vkontakte/android/ui/ActivityResulter;
    invoke-interface {v0, p1, p2, p3}, Lcom/vkontakte/android/ui/ActivityResulter;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_0

    .line 81
    .end local v0    # "resulter":Lcom/vkontakte/android/ui/ActivityResulter;
    :cond_0
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .prologue
    .line 307
    iget-object v0, p0, Lcom/vkontakte/android/GameCardActivity;->slidingLayout:Lcom/vkontakte/android/ui/widget/SlidingUpPanelLayout;

    if-eqz v0, :cond_0

    .line 308
    iget-object v0, p0, Lcom/vkontakte/android/GameCardActivity;->slidingLayout:Lcom/vkontakte/android/ui/widget/SlidingUpPanelLayout;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/SlidingUpPanelLayout;->smoothToBottom()V

    .line 312
    :goto_0
    return-void

    .line 310
    :cond_0
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->onBackPressed()V

    goto :goto_0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 3
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 198
    invoke-super {p0, p1}, Lcom/vkontakte/android/VKActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 199
    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->viewPager:Landroid/support/v4/view/ViewPager;

    if-eqz v1, :cond_0

    .line 200
    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->viewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v1}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v0

    .line 201
    .local v0, "item":I
    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->viewPager:Landroid/support/v4/view/ViewPager;

    iget-object v2, p0, Lcom/vkontakte/android/GameCardActivity;->viewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v2}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 202
    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->viewPager:Landroid/support/v4/view/ViewPager;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/support/v4/view/ViewPager;->setCurrentItem(IZ)V

    .line 204
    .end local v0    # "item":I
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 208
    invoke-super {p0, p1}, Lcom/vkontakte/android/VKActivity;->onCreate(Landroid/os/Bundle;)V

    .line 209
    invoke-virtual {p0}, Lcom/vkontakte/android/GameCardActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    const v2, 0x7f0203d2

    invoke-virtual {v1, v2}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    .line 210
    const v1, 0x7f030033

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/GameCardActivity;->setContentView(I)V

    .line 212
    const v1, 0x7f10018c

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/GameCardActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/support/v4/view/ViewPager;

    iput-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->viewPager:Landroid/support/v4/view/ViewPager;

    .line 213
    const v1, 0x7f1001b6

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/GameCardActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/ui/widget/SlidingUpPanelLayout;

    iput-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->slidingLayout:Lcom/vkontakte/android/ui/widget/SlidingUpPanelLayout;

    .line 214
    const v1, 0x7f1001ba

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/GameCardActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/ui/widget/PageIndicator;

    iput-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->pageIndicator:Lcom/vkontakte/android/ui/widget/PageIndicator;

    .line 215
    const v1, 0x7f1001b7

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/GameCardActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->headerBlock:Landroid/view/View;

    .line 216
    const v1, 0x7f1001b9

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/GameCardActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->pageTitle:Landroid/widget/TextView;

    .line 218
    const v1, 0x7f1001bb

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/GameCardActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->openActionMenu:Landroid/view/View;

    .line 220
    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->viewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v1, p0}, Landroid/support/v4/view/ViewPager;->addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 221
    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->viewPager:Landroid/support/v4/view/ViewPager;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/support/v4/view/ViewPager;->setOffscreenPageLimit(I)V

    .line 223
    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->slidingLayout:Lcom/vkontakte/android/ui/widget/SlidingUpPanelLayout;

    invoke-direct {p0}, Lcom/vkontakte/android/GameCardActivity;->getActionBarHeight()I

    move-result v2

    const/high16 v3, 0x42a00000    # 80.0f

    invoke-static {v3}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v3

    add-int/2addr v2, v3

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/widget/SlidingUpPanelLayout;->setHeaderPadding(I)V

    .line 224
    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->slidingLayout:Lcom/vkontakte/android/ui/widget/SlidingUpPanelLayout;

    invoke-virtual {v1, p0}, Lcom/vkontakte/android/ui/widget/SlidingUpPanelLayout;->setPanelSlideListener(Lcom/vkontakte/android/ui/widget/SlidingUpPanelLayout$PanelSlideListener;)V

    .line 225
    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->slidingLayout:Lcom/vkontakte/android/ui/widget/SlidingUpPanelLayout;

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/widget/SlidingUpPanelLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    new-instance v2, Lcom/vkontakte/android/GameCardActivity$2;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/GameCardActivity$2;-><init>(Lcom/vkontakte/android/GameCardActivity;)V

    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 234
    if-nez p1, :cond_1

    .line 235
    invoke-virtual {p0}, Lcom/vkontakte/android/GameCardActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/vkontakte/android/GameCardActivity;->initValues(Landroid/os/Bundle;)I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/GameCardActivity;->currentIndex:I

    .line 241
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->apiApplications:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 242
    invoke-virtual {p0}, Lcom/vkontakte/android/GameCardActivity;->finish()V

    .line 263
    :cond_0
    :goto_1
    return-void

    .line 237
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->headerBlock:Landroid/view/View;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2}, Landroid/view/View;->setAlpha(F)V

    .line 238
    invoke-direct {p0, p1}, Lcom/vkontakte/android/GameCardActivity;->initValues(Landroid/os/Bundle;)I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/GameCardActivity;->currentIndex:I

    goto :goto_0

    .line 246
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->openActionMenu:Landroid/view/View;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->apiApplications:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    .line 247
    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->apiApplications:Ljava/util/ArrayList;

    iget v2, p0, Lcom/vkontakte/android/GameCardActivity;->currentIndex:I

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/ApiApplication;

    .line 248
    .local v0, "app":Lcom/vkontakte/android/data/ApiApplication;
    iget-object v2, p0, Lcom/vkontakte/android/GameCardActivity;->openActionMenu:Landroid/view/View;

    if-eqz v0, :cond_4

    iget-boolean v1, v0, Lcom/vkontakte/android/data/ApiApplication;->installed:Z

    if-eqz v1, :cond_4

    const/4 v1, 0x0

    :goto_2
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 251
    .end local v0    # "app":Lcom/vkontakte/android/data/ApiApplication;
    :cond_3
    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->title:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    iget-object v1, v1, Lcom/vkontakte/android/data/CatalogInfo;->title:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    invoke-virtual {v1}, Lcom/vkontakte/android/data/CatalogInfo;->hasGenreId()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 252
    new-instance v1, Lcom/vkontakte/android/api/apps/AppsGetGenres;

    invoke-direct {v1}, Lcom/vkontakte/android/api/apps/AppsGetGenres;-><init>()V

    new-instance v2, Lcom/vkontakte/android/GameCardActivity$3;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/GameCardActivity$3;-><init>(Lcom/vkontakte/android/GameCardActivity;)V

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/apps/AppsGetGenres;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 261
    invoke-virtual {v1, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_1

    .line 248
    .restart local v0    # "app":Lcom/vkontakte/android/data/ApiApplication;
    :cond_4
    const/16 v1, 0x8

    goto :goto_2
.end method

.method public onPageScrollStateChanged(I)V
    .locals 0
    .param p1, "state"    # I

    .prologue
    .line 445
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F
    .param p3, "positionOffsetPixels"    # I

    .prologue
    .line 426
    return-void
.end method

.method public onPageSelected(I)V
    .locals 3
    .param p1, "position"    # I

    .prologue
    .line 430
    iput p1, p0, Lcom/vkontakte/android/GameCardActivity;->currentIndex:I

    .line 431
    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->pageIndicator:Lcom/vkontakte/android/ui/widget/PageIndicator;

    if-eqz v1, :cond_0

    .line 432
    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->pageIndicator:Lcom/vkontakte/android/ui/widget/PageIndicator;

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v2}, Lcom/vkontakte/android/ui/widget/PageIndicator;->setIndexOfCurrentPage(IZ)V

    .line 434
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->catalogLoader:Lcom/vkontakte/android/api/apps/CatalogLoader;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->viewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v1}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x3

    if-le p1, v1, :cond_1

    .line 435
    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->catalogLoader:Lcom/vkontakte/android/api/apps/CatalogLoader;

    invoke-virtual {v1}, Lcom/vkontakte/android/api/apps/CatalogLoader;->forceLoadNextPage()Z

    .line 437
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->openActionMenu:Landroid/view/View;

    if-eqz v1, :cond_2

    .line 438
    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->apiApplications:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/ApiApplication;

    .line 439
    .local v0, "app":Lcom/vkontakte/android/data/ApiApplication;
    iget-object v2, p0, Lcom/vkontakte/android/GameCardActivity;->openActionMenu:Landroid/view/View;

    iget-boolean v1, v0, Lcom/vkontakte/android/data/ApiApplication;->installed:Z

    if-eqz v1, :cond_3

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 441
    .end local v0    # "app":Lcom/vkontakte/android/data/ApiApplication;
    :cond_2
    return-void

    .line 439
    .restart local v0    # "app":Lcom/vkontakte/android/data/ApiApplication;
    :cond_3
    const/16 v1, 0x8

    goto :goto_0
.end method

.method public onPanelAnchored(Landroid/view/View;)V
    .locals 0
    .param p1, "panel"    # Landroid/view/View;

    .prologue
    .line 467
    return-void
.end method

.method public onPanelCollapsed(Landroid/view/View;)V
    .locals 0
    .param p1, "panel"    # Landroid/view/View;

    .prologue
    .line 458
    invoke-virtual {p0}, Lcom/vkontakte/android/GameCardActivity;->finish()V

    .line 459
    return-void
.end method

.method public onPanelExpanded(Landroid/view/View;)V
    .locals 0
    .param p1, "panel"    # Landroid/view/View;

    .prologue
    .line 463
    return-void
.end method

.method public onPanelHidden(Landroid/view/View;)V
    .locals 0
    .param p1, "panel"    # Landroid/view/View;

    .prologue
    .line 471
    return-void
.end method

.method public onPanelSlide(Landroid/view/View;F)V
    .locals 1
    .param p1, "panel"    # Landroid/view/View;
    .param p2, "slideOffset"    # F

    .prologue
    .line 451
    iget-object v0, p0, Lcom/vkontakte/android/GameCardActivity;->headerBlock:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 452
    iget-object v0, p0, Lcom/vkontakte/android/GameCardActivity;->headerBlock:Landroid/view/View;

    invoke-virtual {v0, p2}, Landroid/view/View;->setAlpha(F)V

    .line 454
    :cond_0
    return-void
.end method

.method public onRecycleViewCreated(Lme/grishka/appkit/views/UsableRecyclerView;I)V
    .locals 1
    .param p1, "listView"    # Lme/grishka/appkit/views/UsableRecyclerView;
    .param p2, "index"    # I

    .prologue
    .line 477
    iget-object v0, p0, Lcom/vkontakte/android/GameCardActivity;->viewPager:Landroid/support/v4/view/ViewPager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/GameCardActivity;->viewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v0

    if-ne p2, v0, :cond_0

    .line 478
    iget-object v0, p0, Lcom/vkontakte/android/GameCardActivity;->slidingLayout:Lcom/vkontakte/android/ui/widget/SlidingUpPanelLayout;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/widget/SlidingUpPanelLayout;->setTarget(Landroid/support/v7/widget/RecyclerView;)V

    .line 480
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 402
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->onResume()V

    .line 403
    const-string/jumbo v1, "notification"

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/GameCardActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 404
    .local v0, "nm":Landroid/app/NotificationManager;
    const/16 v1, 0x1f8

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 405
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 102
    invoke-super {p0, p1}, Lcom/vkontakte/android/VKActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 103
    iget-object v0, p0, Lcom/vkontakte/android/GameCardActivity;->apiApplications:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/GameCardActivity;->apiApplications:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/16 v1, 0x64

    if-ge v0, v1, :cond_0

    .line 104
    const-string/jumbo v0, "key_applications"

    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->apiApplications:Ljava/util/ArrayList;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 108
    :goto_0
    const-string/jumbo v0, "key_current_application_index"

    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->viewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v1}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 109
    const-string/jumbo v0, "key_catalog_info"

    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->catalogInfo:Lcom/vkontakte/android/data/CatalogInfo;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 110
    const-string/jumbo v0, "key_title"

    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->title:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    return-void

    .line 106
    :cond_0
    const-string/jumbo v0, "key_applications"

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    goto :goto_0
.end method

.method public openActionMenu(Landroid/view/View;)V
    .locals 6
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v5, 0x0

    .line 270
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 271
    .local v1, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/GameCardActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0805b5

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 272
    new-instance v2, Landroid/widget/PopupMenu;

    invoke-direct {v2, p0, p1}, Landroid/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 273
    .local v2, "pm":Landroid/widget/PopupMenu;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v0, v3, :cond_0

    .line 274
    invoke-virtual {v2}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v4

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/CharSequence;

    invoke-interface {v4, v5, v0, v5, v3}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 273
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 276
    :cond_0
    invoke-static {p0}, Lcom/vkontakte/android/GameCardActivity$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/GameCardActivity;)Landroid/widget/PopupMenu$OnMenuItemClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 287
    invoke-virtual {v2}, Landroid/widget/PopupMenu;->show()V

    .line 288
    return-void
.end method

.method public registerActivityResult(Lcom/vkontakte/android/ui/ActivityResulter;)V
    .locals 1
    .param p1, "result"    # Lcom/vkontakte/android/ui/ActivityResulter;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/GameCardActivity;->mResulters:Ljava/util/List;

    if-nez v0, :cond_0

    .line 86
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/GameCardActivity;->mResulters:Ljava/util/List;

    .line 88
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/GameCardActivity;->mResulters:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 89
    return-void
.end method

.method public unregisterActivityResult(Lcom/vkontakte/android/ui/ActivityResulter;)V
    .locals 1
    .param p1, "result"    # Lcom/vkontakte/android/ui/ActivityResulter;

    .prologue
    .line 93
    iget-object v0, p0, Lcom/vkontakte/android/GameCardActivity;->mResulters:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 94
    iget-object v0, p0, Lcom/vkontakte/android/GameCardActivity;->mResulters:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 96
    :cond_0
    return-void
.end method

.method public updateApiAppItem(Lcom/vkontakte/android/data/ApiApplication;)V
    .locals 3
    .param p1, "apiApplication"    # Lcom/vkontakte/android/data/ApiApplication;

    .prologue
    .line 408
    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->apiApplications:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 409
    .local v0, "index":I
    if-ltz v0, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->apiApplications:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 410
    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->apiApplications:Ljava/util/ArrayList;

    invoke-virtual {v1, v0, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 412
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->catalogLoader:Lcom/vkontakte/android/api/apps/CatalogLoader;

    if-eqz v1, :cond_1

    .line 413
    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->catalogLoader:Lcom/vkontakte/android/api/apps/CatalogLoader;

    invoke-virtual {v1, p1}, Lcom/vkontakte/android/api/apps/CatalogLoader;->updateApiApplication(Lcom/vkontakte/android/data/ApiApplication;)V

    .line 415
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->viewPager:Landroid/support/v4/view/ViewPager;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->viewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v1}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v1

    if-ne v0, v1, :cond_2

    .line 416
    iget-object v1, p0, Lcom/vkontakte/android/GameCardActivity;->openActionMenu:Landroid/view/View;

    if-eqz v1, :cond_2

    .line 417
    iget-object v2, p0, Lcom/vkontakte/android/GameCardActivity;->openActionMenu:Landroid/view/View;

    iget-boolean v1, p1, Lcom/vkontakte/android/data/ApiApplication;->installed:Z

    if-eqz v1, :cond_3

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 420
    :cond_2
    return-void

    .line 417
    :cond_3
    const/16 v1, 0x8

    goto :goto_0
.end method
