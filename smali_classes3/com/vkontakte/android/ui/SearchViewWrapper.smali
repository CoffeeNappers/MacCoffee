.class public Lcom/vkontakte/android/ui/SearchViewWrapper;
.super Ljava/lang/Object;
.source "SearchViewWrapper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/SearchViewWrapper$ViewStateListener;,
        Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;
    }
.end annotation


# static fields
.field public static final CONFIRM_TIMEOUT:I = 0x190

.field public static final VOICE_RECOGNITION_RESULT:I = 0x4e20


# instance fields
.field private actionBtn:Landroid/view/View;

.field private activity:Landroid/app/Activity;

.field private clearBtn:Landroid/view/View;

.field private collapseCalled:Z

.field private confirmRunnable:Ljava/lang/Runnable;

.field private expanded:Z

.field private focusView:Landroid/view/View;

.field private input:Landroid/widget/EditText;

.field private listener:Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;

.field private menu:Landroid/view/Menu;

.field private menuItem:Landroid/view/MenuItem;

.field private newText:Ljava/lang/String;

.field private showVoiceOnEmpty:Z

.field private stateListener:Lcom/vkontakte/android/ui/SearchViewWrapper$ViewStateListener;

.field private view:Landroid/view/View;

.field private visibilities:[Z

.field private voiceBtn:Landroid/view/View;

.field private wasExpanded:Z


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;)V
    .locals 1
    .param p1, "act"    # Landroid/app/Activity;
    .param p2, "listener"    # Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;

    .prologue
    .line 65
    const/16 v0, 0x190

    invoke-direct {p0, p1, p2, v0}, Lcom/vkontakte/android/ui/SearchViewWrapper;-><init>(Landroid/app/Activity;Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;I)V

    .line 66
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;I)V
    .locals 11
    .param p1, "act"    # Landroid/app/Activity;
    .param p2, "_listener"    # Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;
    .param p3, "timeout"    # I

    .prologue
    const v10, 0x7f1003e5

    const v9, 0x7f0f000b

    const/16 v8, 0x8

    const/4 v7, 0x1

    const/4 v3, 0x0

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-boolean v3, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->expanded:Z

    .line 43
    iput-boolean v3, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->collapseCalled:Z

    .line 44
    iput-boolean v3, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->wasExpanded:Z

    .line 69
    iput-object p1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->activity:Landroid/app/Activity;

    .line 70
    iput-object p2, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->listener:Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;

    .line 71
    new-instance v3, Lcom/vkontakte/android/ui/SearchViewWrapper$1;

    invoke-direct {v3, p0, p1}, Lcom/vkontakte/android/ui/SearchViewWrapper$1;-><init>(Lcom/vkontakte/android/ui/SearchViewWrapper;Landroid/content/Context;)V

    iput-object v3, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->view:Landroid/view/View;

    .line 78
    iget-object v3, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->view:Landroid/view/View;

    check-cast v3, Landroid/view/ViewGroup;

    new-instance v5, Landroid/view/ContextThemeWrapper;

    invoke-direct {p0}, Lcom/vkontakte/android/ui/SearchViewWrapper;->shouldUseWhiteTheme()Z

    move-result v4

    if-eqz v4, :cond_3

    const v4, 0x7f0b00d8

    :goto_0
    invoke-direct {v5, p1, v4}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    const v4, 0x7f030217

    const/4 v6, 0x0

    invoke-static {v5, v4, v6}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 81
    iget-object v3, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->view:Landroid/view/View;

    const v4, 0x7f10055d

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->clearBtn:Landroid/view/View;

    .line 82
    iget-object v3, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->view:Landroid/view/View;

    const v4, 0x7f10055e

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->voiceBtn:Landroid/view/View;

    .line 83
    iget-object v3, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->view:Landroid/view/View;

    const v4, 0x7f10055f

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->actionBtn:Landroid/view/View;

    .line 84
    iget-object v3, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->clearBtn:Landroid/view/View;

    invoke-static {p0}, Lcom/vkontakte/android/ui/SearchViewWrapper$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ui/SearchViewWrapper;)Landroid/view/View$OnClickListener;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 85
    iget-object v3, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->voiceBtn:Landroid/view/View;

    new-instance v4, Lcom/vkontakte/android/ui/SearchViewWrapper$2;

    invoke-direct {v4, p0}, Lcom/vkontakte/android/ui/SearchViewWrapper$2;-><init>(Lcom/vkontakte/android/ui/SearchViewWrapper;)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 94
    invoke-static {}, Lcom/vkontakte/android/utils/VoiceUtils;->voiceSearchAvailable()Z

    move-result v3

    if-nez v3, :cond_0

    .line 95
    iget-object v3, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->voiceBtn:Landroid/view/View;

    invoke-virtual {v3, v8}, Landroid/view/View;->setVisibility(I)V

    .line 97
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->clearBtn:Landroid/view/View;

    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 98
    iget-object v3, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->actionBtn:Landroid/view/View;

    invoke-virtual {v3, v8}, Landroid/view/View;->setVisibility(I)V

    .line 99
    new-instance v3, Landroid/view/View;

    invoke-direct {v3, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->focusView:Landroid/view/View;

    .line 100
    iget-object v3, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->focusView:Landroid/view/View;

    invoke-virtual {v3, v7}, Landroid/view/View;->setFocusable(Z)V

    .line 101
    iget-object v3, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->focusView:Landroid/view/View;

    invoke-virtual {v3, v7}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 102
    iget-object v3, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->view:Landroid/view/View;

    check-cast v3, Landroid/view/ViewGroup;

    iget-object v4, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->focusView:Landroid/view/View;

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 104
    iget-object v3, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->view:Landroid/view/View;

    invoke-virtual {v3, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    iput-object v3, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->input:Landroid/widget/EditText;

    .line 105
    iget-object v3, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->input:Landroid/widget/EditText;

    invoke-virtual {v3, p0}, Landroid/widget/EditText;->setTag(Ljava/lang/Object;)V

    .line 106
    iget-object v3, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->input:Landroid/widget/EditText;

    new-instance v4, Lcom/vkontakte/android/ui/SearchViewWrapper$3;

    invoke-direct {v4, p0, p3}, Lcom/vkontakte/android/ui/SearchViewWrapper$3;-><init>(Lcom/vkontakte/android/ui/SearchViewWrapper;I)V

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 157
    iget-object v3, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->input:Landroid/widget/EditText;

    invoke-static {p0, p1}, Lcom/vkontakte/android/ui/SearchViewWrapper$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/ui/SearchViewWrapper;Landroid/app/Activity;)Landroid/widget/TextView$OnEditorActionListener;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 168
    iget-object v3, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->input:Landroid/widget/EditText;

    invoke-static {p0}, Lcom/vkontakte/android/ui/SearchViewWrapper$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/ui/SearchViewWrapper;)Landroid/view/View$OnKeyListener;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 175
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x17

    if-ge v3, v4, :cond_1

    .line 176
    iget-object v3, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->input:Landroid/widget/EditText;

    new-instance v4, Lcom/vkontakte/android/ui/SearchViewWrapper$4;

    invoke-direct {v4, p0}, Lcom/vkontakte/android/ui/SearchViewWrapper$4;-><init>(Lcom/vkontakte/android/ui/SearchViewWrapper;)V

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setCustomSelectionActionModeCallback(Landroid/view/ActionMode$Callback;)V

    .line 199
    :cond_1
    invoke-direct {p0}, Lcom/vkontakte/android/ui/SearchViewWrapper;->shouldUseWhiteTheme()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 200
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SearchViewWrapper;->getView()Landroid/view/View;

    move-result-object v3

    const v4, 0x7f10055d

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 201
    .local v0, "searchClear":Landroid/widget/ImageView;
    new-instance v3, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->activity:Landroid/app/Activity;

    invoke-virtual {v5}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v9}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-direct {v3, v4, v5}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 203
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SearchViewWrapper;->getView()Landroid/view/View;

    move-result-object v3

    const v4, 0x7f10055e

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 204
    .local v2, "searchVoice":Landroid/widget/ImageView;
    new-instance v3, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->activity:Landroid/app/Activity;

    invoke-virtual {v5}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v9}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-direct {v3, v4, v5}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 206
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SearchViewWrapper;->getView()Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    .line 207
    .local v1, "searchEditText":Landroid/widget/EditText;
    const-string/jumbo v3, "#A8AAAD"

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setHintTextColor(I)V

    .line 209
    .end local v0    # "searchClear":Landroid/widget/ImageView;
    .end local v1    # "searchEditText":Landroid/widget/EditText;
    .end local v2    # "searchVoice":Landroid/widget/ImageView;
    :cond_2
    return-void

    .line 78
    :cond_3
    const v4, 0x7f0b00cc

    goto/16 :goto_0
.end method

.method static synthetic access$000(Lcom/vkontakte/android/ui/SearchViewWrapper;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/SearchViewWrapper;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->activity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/ui/SearchViewWrapper;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/SearchViewWrapper;

    .prologue
    .line 37
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->showVoiceOnEmpty:Z

    return v0
.end method

.method static synthetic access$1002(Lcom/vkontakte/android/ui/SearchViewWrapper;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/SearchViewWrapper;
    .param p1, "x1"    # Z

    .prologue
    .line 37
    iput-boolean p1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->collapseCalled:Z

    return p1
.end method

.method static synthetic access$200(Lcom/vkontakte/android/ui/SearchViewWrapper;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/SearchViewWrapper;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->voiceBtn:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/ui/SearchViewWrapper;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/SearchViewWrapper;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->clearBtn:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/ui/SearchViewWrapper;)Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/SearchViewWrapper;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->listener:Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vkontakte/android/ui/SearchViewWrapper;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/SearchViewWrapper;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->confirmRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$502(Lcom/vkontakte/android/ui/SearchViewWrapper;Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/SearchViewWrapper;
    .param p1, "x1"    # Ljava/lang/Runnable;

    .prologue
    .line 37
    iput-object p1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->confirmRunnable:Ljava/lang/Runnable;

    return-object p1
.end method

.method static synthetic access$600(Lcom/vkontakte/android/ui/SearchViewWrapper;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/SearchViewWrapper;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->input:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$702(Lcom/vkontakte/android/ui/SearchViewWrapper;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/SearchViewWrapper;
    .param p1, "x1"    # Z

    .prologue
    .line 37
    iput-boolean p1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->wasExpanded:Z

    return p1
.end method

.method static synthetic access$800(Lcom/vkontakte/android/ui/SearchViewWrapper;)Lcom/vkontakte/android/ui/SearchViewWrapper$ViewStateListener;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/SearchViewWrapper;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->stateListener:Lcom/vkontakte/android/ui/SearchViewWrapper$ViewStateListener;

    return-object v0
.end method

.method static synthetic access$900(Lcom/vkontakte/android/ui/SearchViewWrapper;)[Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/SearchViewWrapper;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->visibilities:[Z

    return-object v0
.end method

.method static synthetic access$902(Lcom/vkontakte/android/ui/SearchViewWrapper;[Z)[Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/SearchViewWrapper;
    .param p1, "x1"    # [Z

    .prologue
    .line 37
    iput-object p1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->visibilities:[Z

    return-object p1
.end method

.method private shouldUseWhiteTheme()Z
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->activity:Landroid/app/Activity;

    instance-of v0, v0, Lcom/vk/attachpicker/AttachActivity;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->activity:Landroid/app/Activity;

    instance-of v0, v0, Lcom/vk/stories/ShareStoryActivity;

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private updateVoiceButton()V
    .locals 2

    .prologue
    .line 372
    invoke-static {}, Lcom/vkontakte/android/utils/VoiceUtils;->voiceSearchAvailable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 373
    iget-object v1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->voiceBtn:Landroid/view/View;

    iget-boolean v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->showVoiceOnEmpty:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->input:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->length()I

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 375
    :cond_0
    return-void

    .line 373
    :cond_1
    const/16 v0, 0x8

    goto :goto_0
.end method


# virtual methods
.method public clear()V
    .locals 2

    .prologue
    .line 337
    const-string/jumbo v0, ""

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/SearchViewWrapper;->setText(Ljava/lang/String;)V

    .line 338
    iget-object v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->listener:Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;

    const-string/jumbo v1, ""

    invoke-interface {v0, v1}, Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;->onQueryChanged(Ljava/lang/String;)V

    .line 339
    return-void
.end method

.method public clearFocus()V
    .locals 1

    .prologue
    .line 328
    iget-object v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->input:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->clearFocus()V

    .line 329
    iget-object v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->focusView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 330
    return-void
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 324
    iget-object v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->input:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getView()Landroid/view/View;
    .locals 1

    .prologue
    .line 212
    iget-object v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->view:Landroid/view/View;

    return-object v0
.end method

.method public isExpanded()Z
    .locals 1

    .prologue
    .line 292
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->expanded:Z

    return v0
.end method

.method synthetic lambda$new$0(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 84
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SearchViewWrapper;->clear()V

    return-void
.end method

.method synthetic lambda$new$1(Landroid/app/Activity;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 4
    .param p1, "act"    # Landroid/app/Activity;
    .param p2, "v"    # Landroid/widget/TextView;
    .param p3, "actionId"    # I
    .param p4, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 158
    invoke-virtual {p1}, Landroid/app/Activity;->getCurrentFocus()Landroid/view/View;

    move-result-object v0

    .line 159
    .local v0, "focus":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 160
    const-string/jumbo v2, "input_method"

    invoke-virtual {p1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/inputmethod/InputMethodManager;

    .line 161
    .local v1, "imm":Landroid/view/inputmethod/InputMethodManager;
    invoke-virtual {v0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 162
    invoke-virtual {v0}, Landroid/view/View;->clearFocus()V

    .line 164
    .end local v1    # "imm":Landroid/view/inputmethod/InputMethodManager;
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->input:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->clearFocus()V

    .line 165
    iget-object v2, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->listener:Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;

    invoke-virtual {p2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;->onQuerySubmitted(Ljava/lang/String;)V

    .line 166
    const/4 v2, 0x1

    return v2
.end method

.method synthetic lambda$new$2(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "v"    # Landroid/view/View;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v0, 0x0

    .line 169
    const/4 v1, 0x4

    if-ne p2, v1, :cond_0

    .line 170
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/SearchViewWrapper;->setExpanded(Z)V

    .line 171
    const/4 v0, 0x1

    .line 173
    :cond_0
    return v0
.end method

.method synthetic lambda$submitQuery$3()V
    .locals 3

    .prologue
    .line 346
    iget-object v1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->activity:Landroid/app/Activity;

    const-string/jumbo v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 347
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->input:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 348
    iget-object v1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->input:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->clearFocus()V

    .line 349
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)V
    .locals 4
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 216
    iput-object p1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->menu:Landroid/view/Menu;

    .line 217
    const v2, 0x7f0805e4

    invoke-interface {p1, v2}, Landroid/view/Menu;->add(I)Landroid/view/MenuItem;

    move-result-object v1

    .line 218
    .local v1, "search":Landroid/view/MenuItem;
    const v2, 0x7f0201f7

    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 220
    invoke-direct {p0}, Lcom/vkontakte/android/ui/SearchViewWrapper;->shouldUseWhiteTheme()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 221
    invoke-interface {v1}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 222
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_0

    .line 223
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 224
    iget-object v2, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->activity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0f000b

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    sget-object v3, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, v2, v3}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 227
    .end local v0    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_0
    const/16 v2, 0xa

    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 228
    iget-object v2, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->view:Landroid/view/View;

    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setActionView(Landroid/view/View;)Landroid/view/MenuItem;

    .line 229
    iget-boolean v2, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->expanded:Z

    if-eqz v2, :cond_1

    .line 230
    invoke-interface {v1}, Landroid/view/MenuItem;->expandActionView()Z

    .line 231
    iget-object v2, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->input:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->clearFocus()V

    .line 233
    :cond_1
    iget-object v2, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->newText:Ljava/lang/String;

    if-eqz v2, :cond_2

    .line 234
    iget-object v2, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->input:Landroid/widget/EditText;

    iget-object v3, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->newText:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 235
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->newText:Ljava/lang/String;

    .line 237
    :cond_2
    new-instance v2, Lcom/vkontakte/android/ui/SearchViewWrapper$5;

    invoke-direct {v2, p0, p1, v1}, Lcom/vkontakte/android/ui/SearchViewWrapper$5;-><init>(Lcom/vkontakte/android/ui/SearchViewWrapper;Landroid/view/Menu;Landroid/view/MenuItem;)V

    invoke-static {v1, v2}, Landroid/support/v4/view/MenuItemCompat;->setOnActionExpandListener(Landroid/view/MenuItem;Landroid/support/v4/view/MenuItemCompat$OnActionExpandListener;)Landroid/view/MenuItem;

    .line 281
    iput-object v1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->menuItem:Landroid/view/MenuItem;

    .line 282
    return-void
.end method

.method public onVisibilityChanged(Z)V
    .locals 1
    .param p1, "visible"    # Z

    .prologue
    .line 285
    if-eqz p1, :cond_0

    iget-boolean v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->wasExpanded:Z

    if-eqz v0, :cond_0

    .line 286
    iget-object v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->menuItem:Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->expandActionView()Z

    .line 287
    iget-object v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->input:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->clearFocus()V

    .line 289
    :cond_0
    return-void
.end method

.method public setExpanded(Z)V
    .locals 1
    .param p1, "expanded"    # Z

    .prologue
    .line 296
    iget-object v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->menuItem:Landroid/view/MenuItem;

    if-nez v0, :cond_0

    .line 297
    iput-boolean p1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->expanded:Z

    .line 305
    :goto_0
    return-void

    .line 299
    :cond_0
    if-eqz p1, :cond_1

    .line 300
    iget-object v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->menuItem:Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->expandActionView()Z

    goto :goto_0

    .line 302
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->menuItem:Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->collapseActionView()Z

    goto :goto_0
.end method

.method public setHint(Ljava/lang/String;)V
    .locals 1
    .param p1, "hint"    # Ljava/lang/String;

    .prologue
    .line 308
    iget-object v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->input:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 309
    return-void
.end method

.method public setOnActionClickListener(Landroid/view/View$OnClickListener;)V
    .locals 1
    .param p1, "listener"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 368
    iget-object v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->actionBtn:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 369
    return-void
.end method

.method public setOnActionEnabled(Z)V
    .locals 2
    .param p1, "enabled"    # Z

    .prologue
    .line 363
    iget-object v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->actionBtn:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 364
    iget-object v1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->actionBtn:Landroid/view/View;

    if-eqz p1, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    :goto_0
    invoke-virtual {v1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 365
    return-void

    .line 364
    :cond_0
    const v0, 0x3ec7ae14    # 0.39f

    goto :goto_0
.end method

.method public setOnActionVisible(Z)V
    .locals 2
    .param p1, "visible"    # Z

    .prologue
    .line 359
    iget-object v1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->actionBtn:Landroid/view/View;

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 360
    return-void

    .line 359
    :cond_0
    const/16 v0, 0x8

    goto :goto_0
.end method

.method public setShowVoiceOnEmpty(Z)V
    .locals 0
    .param p1, "value"    # Z

    .prologue
    .line 354
    iput-boolean p1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->showVoiceOnEmpty:Z

    .line 355
    invoke-direct {p0}, Lcom/vkontakte/android/ui/SearchViewWrapper;->updateVoiceButton()V

    .line 356
    return-void
.end method

.method public setStateListener(Lcom/vkontakte/android/ui/SearchViewWrapper$ViewStateListener;)V
    .locals 0
    .param p1, "l"    # Lcom/vkontakte/android/ui/SearchViewWrapper$ViewStateListener;

    .prologue
    .line 333
    iput-object p1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->stateListener:Lcom/vkontakte/android/ui/SearchViewWrapper$ViewStateListener;

    .line 334
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 2
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 312
    iget-object v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->input:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 313
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 314
    iget-object v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->input:Landroid/widget/EditText;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 316
    :cond_0
    return-void
.end method

.method public setTextAndSubmit(Ljava/lang/String;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 319
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->setText(Ljava/lang/String;)V

    .line 320
    iget-object v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->listener:Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;

    invoke-interface {v0, p1}, Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;->onQuerySubmitted(Ljava/lang/String;)V

    .line 321
    return-void
.end method

.method public submitQuery()V
    .locals 2

    .prologue
    .line 342
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SearchViewWrapper;->getText()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 351
    :goto_0
    return-void

    .line 345
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->input:Landroid/widget/EditText;

    invoke-static {p0}, Lcom/vkontakte/android/ui/SearchViewWrapper$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/ui/SearchViewWrapper;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->post(Ljava/lang/Runnable;)Z

    .line 350
    iget-object v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper;->listener:Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/SearchViewWrapper;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;->onQuerySubmitted(Ljava/lang/String;)V

    goto :goto_0
.end method
