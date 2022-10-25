.class public Lcom/vk/stories/StorySettingsActivity;
.super Lcom/vkontakte/android/VKActivity;
.source "StorySettingsActivity.java"


# static fields
.field public static final INTENT_FROM_CREATE_STORY:Ljava/lang/String; = "from_create_story"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Lcom/vkontakte/android/VKActivity;-><init>()V

    return-void
.end method

.method static synthetic lambda$onCreate$1(Landroid/support/v7/widget/SwitchCompat;Landroid/view/View;)V
    .locals 3
    .param p0, "switchView"    # Landroid/support/v7/widget/SwitchCompat;
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 40
    invoke-virtual {p0}, Landroid/support/v7/widget/SwitchCompat;->isChecked()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/SwitchCompat;->setChecked(Z)V

    .line 41
    invoke-static {}, Lcom/vk/attachpicker/util/Prefs;->storiesPrefs()Lcom/vk/attachpicker/util/Prefs;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/attachpicker/util/Prefs;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "save_stories"

    invoke-virtual {p0}, Landroid/support/v7/widget/SwitchCompat;->isChecked()Z

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 42
    return-void

    .line 40
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method synthetic lambda$onCreate$0(Landroid/view/View;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 31
    invoke-virtual {p0}, Lcom/vk/stories/StorySettingsActivity;->finish()V

    return-void
.end method

.method synthetic lambda$onCreate$2(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 46
    new-instance v0, Lcom/vk/stories/StoriesFilterListFragment$Builder;

    invoke-direct {v0}, Lcom/vk/stories/StoriesFilterListFragment$Builder;-><init>()V

    invoke-virtual {v0, p0}, Lcom/vk/stories/StoriesFilterListFragment$Builder;->go(Landroid/content/Context;)Z

    return-void
.end method

.method synthetic lambda$onCreate$3(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 51
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/vk/stories/StoryPrivacySettingsActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/vk/stories/StorySettingsActivity;->startActivity(Landroid/content/Intent;)V

    .line 52
    return-void
.end method

.method synthetic lambda$onCreate$4(ZLandroid/view/View;)V
    .locals 1
    .param p1, "fromCreateStory"    # Z
    .param p2, "v"    # Landroid/view/View;

    .prologue
    .line 59
    invoke-static {}, Lcom/vk/masks/MasksController;->getInstance()Lcom/vk/masks/MasksController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/masks/MasksController;->clear()V

    .line 60
    if-eqz p1, :cond_0

    .line 61
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lcom/vk/stories/StorySettingsActivity;->setResult(I)V

    .line 62
    invoke-virtual {p0}, Lcom/vk/stories/StorySettingsActivity;->finish()V

    .line 64
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 12
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    const/4 v11, 0x0

    .line 24
    invoke-super {p0, p1}, Lcom/vkontakte/android/VKActivity;->onCreate(Landroid/os/Bundle;)V

    .line 25
    const v7, 0x7f03001f

    invoke-virtual {p0, v7}, Lcom/vk/stories/StorySettingsActivity;->setContentView(I)V

    .line 28
    const v7, 0x7f1001b0

    invoke-virtual {p0, v7}, Lcom/vk/stories/StorySettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/support/v7/widget/Toolbar;

    .line 29
    .local v6, "toolbar":Landroid/support/v7/widget/Toolbar;
    new-instance v7, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p0}, Lcom/vk/stories/StorySettingsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {p0}, Lcom/vk/stories/StorySettingsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f020150

    invoke-static {v9, v10}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v9

    invoke-direct {v7, v8, v9}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual {v6, v7}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(Landroid/graphics/drawable/Drawable;)V

    .line 30
    invoke-virtual {v6}, Landroid/support/v7/widget/Toolbar;->getNavigationIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v7

    const v8, 0x7f0f00ba

    invoke-static {p0, v8}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v8

    sget-object v9, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v7, v8, v9}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 31
    invoke-static {p0}, Lcom/vk/stories/StorySettingsActivity$$Lambda$1;->lambdaFactory$(Lcom/vk/stories/StorySettingsActivity;)Landroid/view/View$OnClickListener;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/support/v7/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 32
    const v7, 0x7f08035a

    invoke-virtual {v6, v7}, Landroid/support/v7/widget/Toolbar;->setTitle(I)V

    .line 35
    const v7, 0x7f100185

    invoke-virtual {p0, v7}, Lcom/vk/stories/StorySettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 36
    .local v3, "saveStoriesView":Landroid/view/View;
    const v7, 0x7f100186

    invoke-virtual {v3, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/support/v7/widget/SwitchCompat;

    .line 37
    .local v5, "switchView":Landroid/support/v7/widget/SwitchCompat;
    invoke-virtual {v5, v11}, Landroid/support/v7/widget/SwitchCompat;->setClickable(Z)V

    .line 38
    invoke-static {}, Lcom/vk/attachpicker/util/Prefs;->storiesPrefs()Lcom/vk/attachpicker/util/Prefs;

    move-result-object v7

    const-string/jumbo v8, "save_stories"

    invoke-virtual {v7, v8}, Lcom/vk/attachpicker/util/Prefs;->getBoolean(Ljava/lang/String;)Z

    move-result v7

    invoke-virtual {v5, v7}, Landroid/support/v7/widget/SwitchCompat;->setChecked(Z)V

    .line 39
    invoke-static {v5}, Lcom/vk/stories/StorySettingsActivity$$Lambda$2;->lambdaFactory$(Landroid/support/v7/widget/SwitchCompat;)Landroid/view/View$OnClickListener;

    move-result-object v7

    invoke-virtual {v3, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 45
    const v7, 0x7f100187

    invoke-virtual {p0, v7}, Lcom/vk/stories/StorySettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 46
    .local v1, "hiddenFromStories":Landroid/view/View;
    invoke-static {p0}, Lcom/vk/stories/StorySettingsActivity$$Lambda$3;->lambdaFactory$(Lcom/vk/stories/StorySettingsActivity;)Landroid/view/View$OnClickListener;

    move-result-object v7

    invoke-virtual {v1, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 49
    const v7, 0x7f100188

    invoke-virtual {p0, v7}, Lcom/vk/stories/StorySettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 50
    .local v4, "storiesPrivacy":Landroid/view/View;
    invoke-static {p0}, Lcom/vk/stories/StorySettingsActivity$$Lambda$4;->lambdaFactory$(Lcom/vk/stories/StorySettingsActivity;)Landroid/view/View$OnClickListener;

    move-result-object v7

    invoke-virtual {v4, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 55
    const v7, 0x7f100189

    invoke-virtual {p0, v7}, Lcom/vk/stories/StorySettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 56
    .local v2, "masksCache":Landroid/view/View;
    invoke-static {}, Lcom/vk/media/camera/CameraEffects;->isSupported()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 57
    invoke-virtual {p0}, Lcom/vk/stories/StorySettingsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v7

    const-string/jumbo v8, "from_create_story"

    invoke-virtual {v7, v8, v11}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    .line 58
    .local v0, "fromCreateStory":Z
    invoke-static {p0, v0}, Lcom/vk/stories/StorySettingsActivity$$Lambda$5;->lambdaFactory$(Lcom/vk/stories/StorySettingsActivity;Z)Landroid/view/View$OnClickListener;

    move-result-object v7

    invoke-virtual {v2, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 68
    .end local v0    # "fromCreateStory":Z
    :goto_0
    return-void

    .line 66
    :cond_0
    const/16 v7, 0x8

    invoke-virtual {v2, v7}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method
