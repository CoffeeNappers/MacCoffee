.class public Lcom/vk/attachpicker/PhotoVideoAttachActivity;
.super Lcom/vkontakte/android/VKActivity;
.source "PhotoVideoAttachActivity.java"

# interfaces
.implements Lcom/vk/attachpicker/SelectionContext$SelectionContextProvider;
.implements Lcom/vk/attachpicker/AttachResulter;


# instance fields
.field private attachCounterView:Lcom/vk/attachpicker/widget/AttachCounterView;

.field private bigPreviews:Z

.field private cameraEnabled:Z

.field private cancelView:Landroid/view/View;

.field private completeOptions:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private completeSingleOptions:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private galleryFragment:Lcom/vk/attachpicker/fragment/GalleryFragment;

.field private mediaType:I

.field private final onSelectionUpdate:Lcom/vk/attachpicker/events/NotificationListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/attachpicker/events/NotificationListener",
            "<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private onlyLastNMilliseconds:J

.field private preventStyling:Z

.field private preventStylingPhoto:Z

.field private preventStylingVideo:Z

.field private requestCode:I

.field private final selectionContext:Lcom/vk/attachpicker/SelectionContext;

.field private singleMode:Z

.field private staticHeaderTitle:Ljava/lang/String;

.field private thumb:Z

.field private toolbarContainer:Lcom/vk/attachpicker/widget/ToolbarContainer;

.field private videoMaxLengthMs:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 27
    invoke-direct {p0}, Lcom/vkontakte/android/VKActivity;-><init>()V

    .line 29
    new-instance v0, Lcom/vk/attachpicker/SelectionContext;

    invoke-direct {v0}, Lcom/vk/attachpicker/SelectionContext;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    .line 33
    iput-boolean v1, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->preventStylingPhoto:Z

    .line 34
    iput-boolean v1, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->preventStylingVideo:Z

    .line 35
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->videoMaxLengthMs:J

    .line 230
    new-instance v0, Lcom/vk/attachpicker/PhotoVideoAttachActivity$3;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/PhotoVideoAttachActivity$3;-><init>(Lcom/vk/attachpicker/PhotoVideoAttachActivity;)V

    iput-object v0, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->onSelectionUpdate:Lcom/vk/attachpicker/events/NotificationListener;

    return-void
.end method

.method static synthetic access$000(Lcom/vk/attachpicker/PhotoVideoAttachActivity;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/PhotoVideoAttachActivity;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->cancelView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vk/attachpicker/PhotoVideoAttachActivity;)Lcom/vk/attachpicker/SelectionContext;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/PhotoVideoAttachActivity;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vk/attachpicker/PhotoVideoAttachActivity;)Lcom/vk/attachpicker/widget/AttachCounterView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/PhotoVideoAttachActivity;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->attachCounterView:Lcom/vk/attachpicker/widget/AttachCounterView;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vk/attachpicker/PhotoVideoAttachActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/PhotoVideoAttachActivity;

    .prologue
    .line 27
    invoke-direct {p0}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->hideCancelButton()V

    return-void
.end method

.method static synthetic access$400(Lcom/vk/attachpicker/PhotoVideoAttachActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/PhotoVideoAttachActivity;

    .prologue
    .line 27
    invoke-direct {p0}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->showCancelButton()V

    return-void
.end method

.method private hideCancelButton()V
    .locals 4

    .prologue
    .line 218
    iget-object v0, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->cancelView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    .line 219
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lcom/vk/attachpicker/PhotoVideoAttachActivity$2;

    invoke-direct {v1, p0}, Lcom/vk/attachpicker/PhotoVideoAttachActivity$2;-><init>(Lcom/vk/attachpicker/PhotoVideoAttachActivity;)V

    .line 220
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v2, 0xc8

    .line 226
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 227
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 228
    return-void
.end method

.method private showCancelButton()V
    .locals 4

    .prologue
    .line 209
    iget-object v0, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->cancelView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 210
    iget-object v0, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->cancelView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    .line 211
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    .line 212
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v2, 0xc8

    .line 213
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 214
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 215
    return-void
.end method

.method private showFragment(Landroid/app/Fragment;)V
    .locals 4
    .param p1, "fr"    # Landroid/app/Fragment;

    .prologue
    .line 122
    :try_start_0
    invoke-virtual {p0}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    const v2, 0x7f100461

    invoke-virtual {v1, v2, p1}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 126
    :goto_0
    return-void

    .line 123
    :catch_0
    move-exception v0

    .line 124
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string/jumbo v3, "PhotoVideoAttachActivity"

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private showOptions(Landroid/content/Intent;)V
    .locals 5
    .param p1, "result"    # Landroid/content/Intent;

    .prologue
    .line 151
    invoke-virtual {p0}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->getCompleteOptions()[Ljava/lang/CharSequence;

    move-result-object v1

    .line 153
    .local v1, "options":[Ljava/lang/CharSequence;
    if-eqz v1, :cond_0

    array-length v2, v1

    if-nez v2, :cond_1

    .line 154
    :cond_0
    const/4 v2, -0x1

    invoke-virtual {p0, v2}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->finishActivity(I)V

    .line 172
    :goto_0
    return-void

    .line 160
    :cond_1
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 161
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {p0}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d0047

    iget-object v4, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    invoke-virtual {v4}, Lcom/vk/attachpicker/SelectionContext;->selectionCount()I

    move-result v4

    invoke-virtual {v2, v3, v4}, Landroid/content/res/Resources;->getQuantityString(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 162
    new-instance v2, Lcom/vk/attachpicker/PhotoVideoAttachActivity$1;

    invoke-direct {v2, p0, p1}, Lcom/vk/attachpicker/PhotoVideoAttachActivity$1;-><init>(Lcom/vk/attachpicker/PhotoVideoAttachActivity;Landroid/content/Intent;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 171
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog;->show()V

    goto :goto_0
.end method


# virtual methods
.method public getCompleteOptions()[Ljava/lang/CharSequence;
    .locals 8

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 179
    iget-object v7, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->completeOptions:Ljava/util/ArrayList;

    if-nez v7, :cond_1

    iget-object v7, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->completeSingleOptions:Ljava/util/ArrayList;

    if-nez v7, :cond_1

    .line 180
    const/4 v2, 0x0

    .line 205
    :cond_0
    return-object v2

    .line 183
    :cond_1
    iget-object v7, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->completeOptions:Ljava/util/ArrayList;

    if-eqz v7, :cond_4

    iget-boolean v7, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->singleMode:Z

    if-nez v7, :cond_4

    move v3, v5

    .line 184
    .local v3, "useOptions":Z
    :goto_0
    iget-object v7, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->completeSingleOptions:Ljava/util/ArrayList;

    if-eqz v7, :cond_5

    iget-boolean v7, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->singleMode:Z

    if-nez v7, :cond_2

    iget-object v7, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    invoke-virtual {v7}, Lcom/vk/attachpicker/SelectionContext;->selectionCount()I

    move-result v7

    if-gt v7, v5, :cond_5

    :cond_2
    move v4, v5

    .line 186
    .local v4, "useSingleOptions":Z
    :goto_1
    if-eqz v3, :cond_6

    iget-object v5, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->completeOptions:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    :goto_2
    if-eqz v4, :cond_3

    iget-object v6, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->completeSingleOptions:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    :cond_3
    add-int/2addr v5, v6

    new-array v2, v5, [Ljava/lang/CharSequence;

    .line 188
    .local v2, "sequences":[Ljava/lang/CharSequence;
    array-length v5, v2

    if-eqz v5, :cond_0

    .line 191
    const/4 v1, 0x0

    .line 193
    .local v1, "j":I
    if-eqz v3, :cond_7

    .line 194
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    iget-object v5, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->completeOptions:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v0, v5, :cond_7

    .line 195
    iget-object v5, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->completeOptions:Ljava/util/ArrayList;

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/CharSequence;

    aput-object v5, v2, v1

    .line 194
    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .end local v0    # "i":I
    .end local v1    # "j":I
    .end local v2    # "sequences":[Ljava/lang/CharSequence;
    .end local v3    # "useOptions":Z
    .end local v4    # "useSingleOptions":Z
    :cond_4
    move v3, v6

    .line 183
    goto :goto_0

    .restart local v3    # "useOptions":Z
    :cond_5
    move v4, v6

    .line 184
    goto :goto_1

    .restart local v4    # "useSingleOptions":Z
    :cond_6
    move v5, v6

    .line 186
    goto :goto_2

    .line 199
    .restart local v1    # "j":I
    .restart local v2    # "sequences":[Ljava/lang/CharSequence;
    :cond_7
    if-eqz v4, :cond_0

    .line 200
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_4
    iget-object v5, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->completeSingleOptions:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v0, v5, :cond_0

    .line 201
    iget-object v5, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->completeSingleOptions:Ljava/util/ArrayList;

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/CharSequence;

    aput-object v5, v2, v1

    .line 200
    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v1, v1, 0x1

    goto :goto_4
.end method

.method public getCompleteOptionsSize()I
    .locals 1

    .prologue
    .line 175
    iget-object v0, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->completeOptions:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->singleMode:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->completeOptions:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getSelectionContext()Lcom/vk/attachpicker/SelectionContext;
    .locals 1

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    return-object v0
.end method

.method synthetic lambda$onCreate$0(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 80
    iget-object v0, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    invoke-virtual {v0}, Lcom/vk/attachpicker/SelectionContext;->getPackedSelection()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->setResultAndFinish(Landroid/content/Intent;)V

    .line 81
    return-void
.end method

.method synthetic lambda$onCreate$1(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 82
    invoke-virtual {p0}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->finish()V

    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .prologue
    .line 113
    iget-object v0, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    invoke-virtual {v0}, Lcom/vk/attachpicker/SelectionContext;->selectionCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 114
    iget-object v0, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    invoke-virtual {v0}, Lcom/vk/attachpicker/SelectionContext;->clear()V

    .line 118
    :goto_0
    return-void

    .line 116
    :cond_0
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->onBackPressed()V

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 10
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const-wide/16 v8, 0x0

    const/4 v2, 0x0

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 52
    invoke-super {p0, p1}, Lcom/vkontakte/android/VKActivity;->onCreate(Landroid/os/Bundle;)V

    .line 53
    invoke-static {p0}, Lcom/vk/attachpicker/Picker;->init(Landroid/app/Activity;)V

    .line 54
    invoke-virtual {p0}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    const v3, -0x808081

    invoke-static {v1, v3}, Lcom/vk/attachpicker/util/Utils;->setStatusBarColor(Landroid/view/Window;I)V

    .line 56
    invoke-virtual {p0}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v3, "prevent_styling"

    invoke-virtual {v1, v3, v6}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->preventStyling:Z

    .line 57
    invoke-virtual {p0}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v3, "prevent_styling_photo"

    invoke-virtual {v1, v3, v6}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->preventStylingPhoto:Z

    .line 58
    invoke-virtual {p0}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v3, "prevent_styling_video"

    invoke-virtual {v1, v3, v6}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->preventStylingVideo:Z

    .line 59
    invoke-virtual {p0}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v3, "video_max_length_ms"

    invoke-virtual {v1, v3, v8, v9}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->videoMaxLengthMs:J

    .line 60
    invoke-virtual {p0}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v3, "static_header_title"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->staticHeaderTitle:Ljava/lang/String;

    .line 61
    invoke-virtual {p0}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v3, "big_previews"

    invoke-virtual {v1, v3, v6}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->bigPreviews:Z

    .line 62
    invoke-virtual {p0}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v3, "single_mode"

    invoke-virtual {v1, v3, v6}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->singleMode:Z

    .line 63
    invoke-virtual {p0}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v3, "only_last_n_milliseconds"

    invoke-virtual {v1, v3, v8, v9}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->onlyLastNMilliseconds:J

    .line 64
    invoke-virtual {p0}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v3, "camera_enabled"

    invoke-virtual {v1, v3, v7}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->cameraEnabled:Z

    .line 65
    invoke-virtual {p0}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v3, "media_type"

    const/16 v4, 0xde

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->mediaType:I

    .line 66
    invoke-virtual {p0}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v3, "force_thumb"

    invoke-virtual {v1, v3, v6}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->thumb:Z

    .line 67
    invoke-virtual {p0}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v3, "request_code"

    invoke-virtual {v1, v3, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->requestCode:I

    .line 68
    invoke-virtual {p0}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v3, "complete_options"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v3, "complete_options"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->getStringArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    :goto_0
    iput-object v1, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->completeOptions:Ljava/util/ArrayList;

    .line 69
    invoke-virtual {p0}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v3, "complete_options_single"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "complete_options_single"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    :cond_0
    iput-object v2, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->completeSingleOptions:Ljava/util/ArrayList;

    .line 71
    iget-object v1, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    invoke-virtual {p0}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string/jumbo v3, "selection_limit"

    const/16 v4, 0xa

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/SelectionContext;->setLimit(I)V

    .line 72
    iget-object v1, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->selectionContext:Lcom/vk/attachpicker/SelectionContext;

    iget v2, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->requestCode:I

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/SelectionContext;->setRequestCode(I)V

    .line 74
    const v1, 0x7f030190

    invoke-virtual {p0, v1}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->setContentView(I)V

    .line 75
    const v1, 0x7f100460

    invoke-virtual {p0, v1}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/widget/ToolbarContainer;

    iput-object v1, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->toolbarContainer:Lcom/vk/attachpicker/widget/ToolbarContainer;

    .line 76
    const v1, 0x7f100456

    invoke-virtual {p0, v1}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/widget/AttachCounterView;

    iput-object v1, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->attachCounterView:Lcom/vk/attachpicker/widget/AttachCounterView;

    .line 77
    const v1, 0x7f100457

    invoke-virtual {p0, v1}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->cancelView:Landroid/view/View;

    .line 79
    iget-object v1, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->attachCounterView:Lcom/vk/attachpicker/widget/AttachCounterView;

    invoke-static {p0}, Lcom/vk/attachpicker/PhotoVideoAttachActivity$$Lambda$1;->lambdaFactory$(Lcom/vk/attachpicker/PhotoVideoAttachActivity;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/AttachCounterView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 82
    iget-object v1, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->cancelView:Landroid/view/View;

    invoke-static {p0}, Lcom/vk/attachpicker/PhotoVideoAttachActivity$$Lambda$2;->lambdaFactory$(Lcom/vk/attachpicker/PhotoVideoAttachActivity;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 84
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 85
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "prevent_styling"

    iget-boolean v2, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->preventStyling:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 86
    const-string/jumbo v1, "prevent_styling_photo"

    iget-boolean v2, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->preventStylingPhoto:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 87
    const-string/jumbo v1, "prevent_styling_video"

    iget-boolean v2, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->preventStylingVideo:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 88
    const-string/jumbo v1, "video_max_length_ms"

    iget-wide v2, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->videoMaxLengthMs:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 89
    const-string/jumbo v1, "static_header_title"

    iget-object v2, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->staticHeaderTitle:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    const-string/jumbo v1, "big_previews"

    iget-boolean v2, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->bigPreviews:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 91
    const-string/jumbo v1, "only_last_n_milliseconds"

    iget-wide v2, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->onlyLastNMilliseconds:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 92
    const-string/jumbo v1, "single_mode"

    iget-boolean v2, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->singleMode:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 93
    const-string/jumbo v1, "camera_enabled"

    iget-boolean v2, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->cameraEnabled:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 94
    const-string/jumbo v1, "media_type"

    iget v2, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->mediaType:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 95
    const-string/jumbo v1, "force_thumb"

    iget-boolean v2, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->thumb:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 96
    new-instance v1, Lcom/vk/attachpicker/fragment/GalleryFragment;

    invoke-direct {v1}, Lcom/vk/attachpicker/fragment/GalleryFragment;-><init>()V

    iput-object v1, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->galleryFragment:Lcom/vk/attachpicker/fragment/GalleryFragment;

    .line 97
    iget-object v1, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->galleryFragment:Lcom/vk/attachpicker/fragment/GalleryFragment;

    invoke-virtual {v1, v0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->setArguments(Landroid/os/Bundle;)V

    .line 98
    iget-object v1, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->galleryFragment:Lcom/vk/attachpicker/fragment/GalleryFragment;

    iget-object v2, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->staticHeaderTitle:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/fragment/GalleryFragment;->setStaticHeaderTitle(Ljava/lang/String;)V

    .line 99
    iget-object v1, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->toolbarContainer:Lcom/vk/attachpicker/widget/ToolbarContainer;

    iget-object v2, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->galleryFragment:Lcom/vk/attachpicker/fragment/GalleryFragment;

    invoke-virtual {v2, p0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->provideToolbar(Landroid/content/Context;)Landroid/view/ViewGroup;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/ToolbarContainer;->addView(Landroid/view/View;)V

    .line 100
    iget-object v1, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->galleryFragment:Lcom/vk/attachpicker/fragment/GalleryFragment;

    invoke-direct {p0, v1}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->showFragment(Landroid/app/Fragment;)V

    .line 102
    invoke-static {}, Lcom/vk/attachpicker/events/NotificationCenter;->getInstance()Lcom/vk/attachpicker/events/NotificationCenter;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->onSelectionUpdate:Lcom/vk/attachpicker/events/NotificationListener;

    invoke-virtual {v1, v7, v2}, Lcom/vk/attachpicker/events/NotificationCenter;->addListener(ILcom/vk/attachpicker/events/NotificationListener;)V

    .line 103
    return-void

    .end local v0    # "args":Landroid/os/Bundle;
    :cond_1
    move-object v1, v2

    .line 68
    goto/16 :goto_0
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 107
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->onDestroy()V

    .line 108
    invoke-static {}, Lcom/vk/attachpicker/events/NotificationCenter;->getInstance()Lcom/vk/attachpicker/events/NotificationCenter;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->onSelectionUpdate:Lcom/vk/attachpicker/events/NotificationListener;

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/events/NotificationCenter;->removeListener(Lcom/vk/attachpicker/events/NotificationListener;)V

    .line 109
    return-void
.end method

.method public setResultAndFinish(Landroid/content/Intent;)V
    .locals 1
    .param p1, "result"    # Landroid/content/Intent;

    .prologue
    .line 136
    if-nez p1, :cond_0

    .line 137
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->setResult(I)V

    .line 138
    invoke-virtual {p0}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->finish()V

    .line 148
    :goto_0
    return-void

    .line 142
    :cond_0
    invoke-virtual {p0}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->getCompleteOptionsSize()I

    move-result v0

    if-lez v0, :cond_1

    .line 143
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->showOptions(Landroid/content/Intent;)V

    goto :goto_0

    .line 145
    :cond_1
    const/4 v0, -0x1

    invoke-virtual {p0, v0, p1}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->setResult(ILandroid/content/Intent;)V

    .line 146
    invoke-virtual {p0}, Lcom/vk/attachpicker/PhotoVideoAttachActivity;->finish()V

    goto :goto_0
.end method
