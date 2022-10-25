.class public Lcom/vk/stories/dialog/StorySendMessageDialog;
.super Landroid/app/Dialog;
.source "StorySendMessageDialog.java"


# static fields
.field private static final DISABLED_SEND_ALPHA:F = 0.4f


# instance fields
.field private clickHandler:Landroid/view/View;

.field private editText:Lcom/vk/attachpicker/widget/BackPressEditText;

.field private sendButton:Landroid/widget/ImageView;

.field private final storyEntry:Lcom/vk/stories/model/StoryEntry;

.field private final uid:I


# direct methods
.method public constructor <init>(Landroid/content/Context;ILcom/vk/stories/model/StoryEntry;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "uid"    # I
    .param p3, "entry"    # Lcom/vk/stories/model/StoryEntry;

    .prologue
    const/4 v4, 0x0

    .line 38
    const v1, 0x7f0b00a7

    invoke-direct {p0, p1, v1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 39
    iput p2, p0, Lcom/vk/stories/dialog/StorySendMessageDialog;->uid:I

    .line 40
    iput-object p3, p0, Lcom/vk/stories/dialog/StorySendMessageDialog;->storyEntry:Lcom/vk/stories/model/StoryEntry;

    .line 43
    invoke-virtual {p0}, Lcom/vk/stories/dialog/StorySendMessageDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-static {v1}, Lcom/vk/core/util/KeyboardUtils;->setSoftInputModeAdjustPan(Landroid/view/Window;)V

    .line 44
    invoke-virtual {p0}, Lcom/vk/stories/dialog/StorySendMessageDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    const v2, 0x7f0b0166

    invoke-virtual {v1, v2}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 47
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0300dc

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 48
    .local v0, "view":Landroid/view/View;
    invoke-virtual {p0, v0}, Lcom/vk/stories/dialog/StorySendMessageDialog;->setContentView(Landroid/view/View;)V

    .line 51
    const v1, 0x7f100336

    invoke-virtual {p0, v1}, Lcom/vk/stories/dialog/StorySendMessageDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/widget/BackPressEditText;

    iput-object v1, p0, Lcom/vk/stories/dialog/StorySendMessageDialog;->editText:Lcom/vk/attachpicker/widget/BackPressEditText;

    .line 52
    const v1, 0x7f100337

    invoke-virtual {p0, v1}, Lcom/vk/stories/dialog/StorySendMessageDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/vk/stories/dialog/StorySendMessageDialog;->sendButton:Landroid/widget/ImageView;

    .line 53
    const v1, 0x7f100335

    invoke-virtual {p0, v1}, Lcom/vk/stories/dialog/StorySendMessageDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/stories/dialog/StorySendMessageDialog;->clickHandler:Landroid/view/View;

    .line 56
    iget-object v1, p0, Lcom/vk/stories/dialog/StorySendMessageDialog;->sendButton:Landroid/widget/ImageView;

    invoke-static {p0}, Lcom/vk/stories/dialog/StorySendMessageDialog$$Lambda$1;->lambdaFactory$(Lcom/vk/stories/dialog/StorySendMessageDialog;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 59
    iget-object v1, p0, Lcom/vk/stories/dialog/StorySendMessageDialog;->sendButton:Landroid/widget/ImageView;

    const v2, 0x3ecccccd    # 0.4f

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 60
    iget-object v1, p0, Lcom/vk/stories/dialog/StorySendMessageDialog;->sendButton:Landroid/widget/ImageView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setEnabled(Z)V

    .line 63
    iget-object v1, p0, Lcom/vk/stories/dialog/StorySendMessageDialog;->editText:Lcom/vk/attachpicker/widget/BackPressEditText;

    new-instance v2, Lcom/vk/stories/dialog/StorySendMessageDialog$1;

    invoke-direct {v2, p0}, Lcom/vk/stories/dialog/StorySendMessageDialog$1;-><init>(Lcom/vk/stories/dialog/StorySendMessageDialog;)V

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/BackPressEditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 80
    iget-object v1, p0, Lcom/vk/stories/dialog/StorySendMessageDialog;->editText:Lcom/vk/attachpicker/widget/BackPressEditText;

    sget-object v2, Lcom/vk/attachpicker/widget/EmptyLineTextWatcher;->INSTANCE:Lcom/vk/attachpicker/widget/EmptyLineTextWatcher;

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/BackPressEditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 82
    iget-object v1, p0, Lcom/vk/stories/dialog/StorySendMessageDialog;->editText:Lcom/vk/attachpicker/widget/BackPressEditText;

    invoke-virtual {v1, v4}, Lcom/vk/attachpicker/widget/BackPressEditText;->setAlpha(F)V

    .line 83
    iget-object v1, p0, Lcom/vk/stories/dialog/StorySendMessageDialog;->sendButton:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 84
    iget-object v1, p0, Lcom/vk/stories/dialog/StorySendMessageDialog;->editText:Lcom/vk/attachpicker/widget/BackPressEditText;

    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/BackPressEditText;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    new-instance v2, Lcom/vk/stories/dialog/StorySendMessageDialog$2;

    invoke-direct {v2, p0}, Lcom/vk/stories/dialog/StorySendMessageDialog$2;-><init>(Lcom/vk/stories/dialog/StorySendMessageDialog;)V

    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 97
    iget-object v1, p0, Lcom/vk/stories/dialog/StorySendMessageDialog;->editText:Lcom/vk/attachpicker/widget/BackPressEditText;

    new-instance v2, Lcom/vk/stories/dialog/StorySendMessageDialog$3;

    invoke-direct {v2, p0}, Lcom/vk/stories/dialog/StorySendMessageDialog$3;-><init>(Lcom/vk/stories/dialog/StorySendMessageDialog;)V

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/BackPressEditText;->setCallback(Lcom/vk/attachpicker/widget/BackPressEditText$OnBackPressedCallback;)V

    .line 105
    iget-object v1, p0, Lcom/vk/stories/dialog/StorySendMessageDialog;->clickHandler:Landroid/view/View;

    invoke-static {}, Lcom/vk/stories/dialog/StorySendMessageDialog$$Lambda$2;->lambdaFactory$()Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 108
    return-void
.end method

.method static synthetic access$000(Lcom/vk/stories/dialog/StorySendMessageDialog;)Landroid/widget/ImageView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/dialog/StorySendMessageDialog;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/vk/stories/dialog/StorySendMessageDialog;->sendButton:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vk/stories/dialog/StorySendMessageDialog;)Lcom/vk/attachpicker/widget/BackPressEditText;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/dialog/StorySendMessageDialog;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/vk/stories/dialog/StorySendMessageDialog;->editText:Lcom/vk/attachpicker/widget/BackPressEditText;

    return-object v0
.end method

.method static synthetic lambda$new$1(Landroid/view/View;)V
    .locals 0
    .param p0, "view1"    # Landroid/view/View;

    .prologue
    .line 107
    return-void
.end method

.method private sendMessage()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 115
    iget-object v1, p0, Lcom/vk/stories/dialog/StorySendMessageDialog;->editText:Lcom/vk/attachpicker/widget/BackPressEditText;

    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/BackPressEditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 116
    .local v0, "text":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 117
    iget v1, p0, Lcom/vk/stories/dialog/StorySendMessageDialog;->uid:I

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/vk/stories/dialog/StorySendMessageDialog;->storyEntry:Lcom/vk/stories/model/StoryEntry;

    invoke-virtual {v3}, Lcom/vk/stories/model/StoryEntry;->link()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v1, v2, v3, v4, v5}, Lcom/vkontakte/android/data/Messages;->send(ILjava/lang/String;Ljava/util/List;Ljava/util/List;I)Lcom/vkontakte/android/Message;

    .line 118
    invoke-virtual {p0}, Lcom/vk/stories/dialog/StorySendMessageDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f08035d

    invoke-static {v1, v2, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 119
    invoke-virtual {p0}, Lcom/vk/stories/dialog/StorySendMessageDialog;->dismiss()V

    .line 121
    :cond_0
    return-void
.end method


# virtual methods
.method synthetic lambda$new$0(Landroid/view/View;)V
    .locals 0
    .param p1, "view1"    # Landroid/view/View;

    .prologue
    .line 57
    invoke-direct {p0}, Lcom/vk/stories/dialog/StorySendMessageDialog;->sendMessage()V

    .line 58
    return-void
.end method

.method synthetic lambda$openKeyboard$2()V
    .locals 1

    .prologue
    .line 111
    iget-object v0, p0, Lcom/vk/stories/dialog/StorySendMessageDialog;->editText:Lcom/vk/attachpicker/widget/BackPressEditText;

    invoke-static {v0}, Lcom/vk/core/util/KeyboardUtils;->showKeyboard(Landroid/view/View;)V

    return-void
.end method

.method public openKeyboard()V
    .locals 4

    .prologue
    .line 111
    invoke-static {p0}, Lcom/vk/stories/dialog/StorySendMessageDialog$$Lambda$3;->lambdaFactory$(Lcom/vk/stories/dialog/StorySendMessageDialog;)Ljava/lang/Runnable;

    move-result-object v0

    const-wide/16 v2, 0x12c

    invoke-static {v0, v2, v3}, Lcom/vk/attachpicker/Picker;->runDelayed(Ljava/lang/Runnable;J)V

    .line 112
    return-void
.end method
