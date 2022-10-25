.class public final Lcom/vkontakte/android/VkChooserTargetService;
.super Landroid/service/chooser/ChooserTargetService;
.source "VkChooserTargetService.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x17
.end annotation


# static fields
.field public static final MAX_TARGETS:I = 0x4


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Landroid/service/chooser/ChooserTargetService;-><init>()V

    return-void
.end method

.method private createTargetExtras(Lcom/vkontakte/android/DialogEntry;)Landroid/os/Bundle;
    .locals 3
    .param p1, "dialog"    # Lcom/vkontakte/android/DialogEntry;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 62
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 63
    .local v0, "extras":Landroid/os/Bundle;
    const-string/jumbo v1, "com.vkontakte.android.EXTRA_RECIPIENT_UID"

    iget-object v2, p1, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v2, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 64
    const-string/jumbo v1, "com.vkontakte.android.EXTRA_RECIPIENT_FULL_NAME"

    iget-object v2, p1, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v2, v2, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    const-string/jumbo v1, "com.vkontakte.android.EXTRA_RECIPIENT_PHOTO"

    iget-object v2, p1, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v2, v2, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    return-object v0
.end method

.method private createTargetIcon(Lcom/vkontakte/android/DialogEntry;)Landroid/graphics/drawable/Icon;
    .locals 1
    .param p1, "dialog"    # Lcom/vkontakte/android/DialogEntry;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 57
    iget-object v0, p1, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/imageloader/VKImageLoader;->getBitmap(Landroid/net/Uri;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/RxUtil;->blockingGetWithNull(Lio/reactivex/Observable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    invoke-static {v0}, Lcom/vk/imageloader/ImageLoaderUtils;->makeCircleBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-static {v0}, Landroid/graphics/drawable/Icon;->createWithBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Icon;

    move-result-object v0

    return-object v0
.end method

.method private createTargetTitle(Lcom/vkontakte/android/DialogEntry;)Ljava/lang/CharSequence;
    .locals 1
    .param p1, "dialog"    # Lcom/vkontakte/android/DialogEntry;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 52
    iget-object v0, p1, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public onGetChooserTargets(Landroid/content/ComponentName;Landroid/content/IntentFilter;)Ljava/util/List;
    .locals 10
    .param p1, "targetActivityName"    # Landroid/content/ComponentName;
    .param p2, "matchedFilter"    # Landroid/content/IntentFilter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ComponentName;",
            "Landroid/content/IntentFilter;",
            ")",
            "Ljava/util/List",
            "<",
            "Landroid/service/chooser/ChooserTarget;",
            ">;"
        }
    .end annotation

    .prologue
    .line 32
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 34
    .local v8, "targets":Ljava/util/List;, "Ljava/util/List<Landroid/service/chooser/ChooserTarget;>;"
    new-instance v4, Landroid/content/ComponentName;

    invoke-virtual {p0}, Lcom/vkontakte/android/VkChooserTargetService;->getPackageName()Ljava/lang/String;

    move-result-object v0

    const-class v1, Lcom/vkontakte/android/SendActivity;

    invoke-virtual {v1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v4, v0, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .local v4, "componentName":Landroid/content/ComponentName;
    const/4 v0, 0x0

    const/4 v1, 0x4

    invoke-static {v0, v1}, Lcom/vkontakte/android/cache/Cache;->getDialogs(II)Ljava/util/ArrayList;

    move-result-object v7

    .line 37
    .local v7, "dialogs":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/DialogEntry;>;"
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/DialogEntry;

    .line 38
    .local v6, "dialog":Lcom/vkontakte/android/DialogEntry;
    new-instance v0, Landroid/service/chooser/ChooserTarget;

    .line 40
    invoke-direct {p0, v6}, Lcom/vkontakte/android/VkChooserTargetService;->createTargetTitle(Lcom/vkontakte/android/DialogEntry;)Ljava/lang/CharSequence;

    move-result-object v1

    .line 41
    invoke-direct {p0, v6}, Lcom/vkontakte/android/VkChooserTargetService;->createTargetIcon(Lcom/vkontakte/android/DialogEntry;)Landroid/graphics/drawable/Icon;

    move-result-object v2

    const/high16 v3, 0x3f800000    # 1.0f

    .line 44
    invoke-direct {p0, v6}, Lcom/vkontakte/android/VkChooserTargetService;->createTargetExtras(Lcom/vkontakte/android/DialogEntry;)Landroid/os/Bundle;

    move-result-object v5

    invoke-direct/range {v0 .. v5}, Landroid/service/chooser/ChooserTarget;-><init>(Ljava/lang/CharSequence;Landroid/graphics/drawable/Icon;FLandroid/content/ComponentName;Landroid/os/Bundle;)V

    .line 38
    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 47
    .end local v6    # "dialog":Lcom/vkontakte/android/DialogEntry;
    :cond_0
    return-object v8
.end method
