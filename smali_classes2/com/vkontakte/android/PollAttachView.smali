.class public Lcom/vkontakte/android/PollAttachView;
.super Landroid/widget/LinearLayout;
.source "PollAttachView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/PollAttachView$OnDataLoadedListener;
    }
.end annotation


# instance fields
.field private infoView:Landroid/widget/TextView;

.field public isBoard:Z

.field public isPublic:Z

.field private listener:Lcom/vkontakte/android/PollAttachView$OnDataLoadedListener;

.field private oid:I

.field private optionViews:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private options:[Lcom/vkontakte/android/api/PollOption;

.field private pid:I

.field private question:Ljava/lang/String;

.field private userOption:I


# direct methods
.method public constructor <init>(Landroid/content/Context;II)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "_oid"    # I
    .param p3, "_pid"    # I

    .prologue
    const/high16 v3, 0x41f00000    # 30.0f

    const/high16 v5, 0x41200000    # 10.0f

    .line 43
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 35
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/vkontakte/android/PollAttachView;->optionViews:Ljava/util/ArrayList;

    .line 44
    iput p2, p0, Lcom/vkontakte/android/PollAttachView;->oid:I

    .line 45
    iput p3, p0, Lcom/vkontakte/android/PollAttachView;->pid:I

    .line 46
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/PollAttachView;->setOrientation(I)V

    .line 47
    new-instance v0, Landroid/widget/ProgressBar;

    invoke-virtual {p0}, Lcom/vkontakte/android/PollAttachView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;)V

    .line 48
    .local v0, "pb":Landroid/widget/ProgressBar;
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {v3}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v2

    invoke-static {v3}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v3

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 49
    .local v1, "pl":Landroid/widget/LinearLayout$LayoutParams;
    const/16 v2, 0x11

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 50
    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 51
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/PollAttachView;->addView(Landroid/view/View;)V

    .line 52
    const/high16 v2, 0x40a00000    # 5.0f

    invoke-static {v2}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v2

    const/4 v3, 0x0

    invoke-static {v5}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v4

    invoke-static {v5}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v5

    invoke-virtual {p0, v2, v3, v4, v5}, Lcom/vkontakte/android/PollAttachView;->setPadding(IIII)V

    .line 53
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 56
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 35
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/PollAttachView;->optionViews:Ljava/util/ArrayList;

    .line 58
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/PollAttachView;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/PollAttachView;

    .prologue
    .line 29
    iget v0, p0, Lcom/vkontakte/android/PollAttachView;->userOption:I

    return v0
.end method

.method static synthetic access$002(Lcom/vkontakte/android/PollAttachView;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/PollAttachView;
    .param p1, "x1"    # I

    .prologue
    .line 29
    iput p1, p0, Lcom/vkontakte/android/PollAttachView;->userOption:I

    return p1
.end method

.method static synthetic access$100(Lcom/vkontakte/android/PollAttachView;Lcom/vkontakte/android/api/PollOption;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/PollAttachView;
    .param p1, "x1"    # Lcom/vkontakte/android/api/PollOption;

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lcom/vkontakte/android/PollAttachView;->vote(Lcom/vkontakte/android/api/PollOption;)V

    return-void
.end method

.method static synthetic access$200(Lcom/vkontakte/android/PollAttachView;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/PollAttachView;

    .prologue
    .line 29
    iget v0, p0, Lcom/vkontakte/android/PollAttachView;->oid:I

    return v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/PollAttachView;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/PollAttachView;

    .prologue
    .line 29
    iget v0, p0, Lcom/vkontakte/android/PollAttachView;->pid:I

    return v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/PollAttachView;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/PollAttachView;

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/vkontakte/android/PollAttachView;->unvote()V

    return-void
.end method

.method static synthetic access$500(Lcom/vkontakte/android/PollAttachView;)[Lcom/vkontakte/android/api/PollOption;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/PollAttachView;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/vkontakte/android/PollAttachView;->options:[Lcom/vkontakte/android/api/PollOption;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/PollAttachView;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/PollAttachView;

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/vkontakte/android/PollAttachView;->updateText()V

    return-void
.end method

.method static synthetic access$700(Lcom/vkontakte/android/PollAttachView;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/PollAttachView;

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/vkontakte/android/PollAttachView;->animateProgress()V

    return-void
.end method

.method private animateProgress()V
    .locals 14

    .prologue
    const/4 v13, 0x1

    const/high16 v12, 0x41200000    # 10.0f

    const/4 v7, 0x0

    const v11, 0x7f10006a

    .line 256
    const/4 v2, 0x0

    .line 257
    .local v2, "maxp":F
    iget-object v8, p0, Lcom/vkontakte/android/PollAttachView;->options:[Lcom/vkontakte/android/api/PollOption;

    array-length v9, v8

    move v6, v7

    :goto_0
    if-ge v6, v9, :cond_0

    aget-object v3, v8, v6

    .line 258
    .local v3, "opt":Lcom/vkontakte/android/api/PollOption;
    iget v10, v3, Lcom/vkontakte/android/api/PollOption;->percent:F

    invoke-static {v2, v10}, Ljava/lang/Math;->max(FF)F

    move-result v2

    .line 257
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 260
    .end local v3    # "opt":Lcom/vkontakte/android/api/PollOption;
    :cond_0
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0xb

    if-lt v6, v8, :cond_4

    .line 261
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 262
    .local v0, "anims":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/animation/Animator;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget-object v6, p0, Lcom/vkontakte/android/PollAttachView;->options:[Lcom/vkontakte/android/api/PollOption;

    array-length v6, v6

    if-ge v1, v6, :cond_2

    .line 263
    iget-object v6, p0, Lcom/vkontakte/android/PollAttachView;->options:[Lcom/vkontakte/android/api/PollOption;

    aget-object v3, v6, v1

    .line 264
    .restart local v3    # "opt":Lcom/vkontakte/android/api/PollOption;
    iget-object v6, p0, Lcom/vkontakte/android/PollAttachView;->optionViews:Ljava/util/ArrayList;

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    .line 265
    .local v4, "ov":Landroid/view/View;
    invoke-virtual {v4, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ProgressBar;

    mul-float v8, v2, v12

    float-to-int v8, v8

    invoke-virtual {v6, v8}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 266
    iget v6, p0, Lcom/vkontakte/android/PollAttachView;->userOption:I

    if-eqz v6, :cond_1

    .line 267
    invoke-virtual {v4, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    const-string/jumbo v8, "progress"

    new-array v9, v13, [I

    iget v10, v3, Lcom/vkontakte/android/api/PollOption;->percent:F

    mul-float/2addr v10, v12

    float-to-int v10, v10

    aput v10, v9, v7

    invoke-static {v6, v8, v9}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 262
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 269
    :cond_1
    invoke-virtual {v4, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    const-string/jumbo v8, "progress"

    new-array v9, v13, [I

    aput v7, v9, v7

    invoke-static {v6, v8, v9}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 272
    .end local v3    # "opt":Lcom/vkontakte/android/api/PollOption;
    .end local v4    # "ov":Landroid/view/View;
    :cond_2
    new-instance v5, Landroid/animation/AnimatorSet;

    invoke-direct {v5}, Landroid/animation/AnimatorSet;-><init>()V

    .line 273
    .local v5, "set":Landroid/animation/AnimatorSet;
    invoke-virtual {v5, v0}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 274
    const-wide/16 v6, 0x190

    invoke-virtual {v5, v6, v7}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 275
    invoke-virtual {v5}, Landroid/animation/AnimatorSet;->start()V

    .line 288
    .end local v0    # "anims":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/animation/Animator;>;"
    .end local v5    # "set":Landroid/animation/AnimatorSet;
    :cond_3
    return-void

    .line 277
    .end local v1    # "i":I
    :cond_4
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_3
    iget-object v6, p0, Lcom/vkontakte/android/PollAttachView;->options:[Lcom/vkontakte/android/api/PollOption;

    array-length v6, v6

    if-ge v1, v6, :cond_3

    .line 278
    iget-object v6, p0, Lcom/vkontakte/android/PollAttachView;->options:[Lcom/vkontakte/android/api/PollOption;

    aget-object v3, v6, v1

    .line 279
    .restart local v3    # "opt":Lcom/vkontakte/android/api/PollOption;
    iget-object v6, p0, Lcom/vkontakte/android/PollAttachView;->optionViews:Ljava/util/ArrayList;

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    .line 280
    .restart local v4    # "ov":Landroid/view/View;
    invoke-virtual {v4, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ProgressBar;

    mul-float v8, v2, v12

    float-to-int v8, v8

    invoke-virtual {v6, v8}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 281
    iget v6, p0, Lcom/vkontakte/android/PollAttachView;->userOption:I

    if-eqz v6, :cond_5

    .line 282
    invoke-virtual {v4, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ProgressBar;

    iget v8, v3, Lcom/vkontakte/android/api/PollOption;->percent:F

    mul-float/2addr v8, v12

    float-to-int v8, v8

    invoke-virtual {v6, v8}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 277
    :goto_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 284
    :cond_5
    invoke-virtual {v4, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ProgressBar;

    invoke-virtual {v6, v7}, Landroid/widget/ProgressBar;->setProgress(I)V

    goto :goto_4
.end method

.method private onFailed(Ljava/lang/String;)V
    .locals 5
    .param p1, "emsg"    # Ljava/lang/String;

    .prologue
    const/high16 v4, 0x40a00000    # 5.0f

    .line 66
    invoke-virtual {p0}, Lcom/vkontakte/android/PollAttachView;->removeAllViews()V

    .line 68
    new-instance v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/PollAttachView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 69
    .local v0, "tv":Landroid/widget/TextView;
    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 70
    invoke-static {v4}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v1

    invoke-static {v4}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v2

    invoke-static {v4}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v3

    invoke-static {v4}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 71
    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 72
    invoke-virtual {p0}, Lcom/vkontakte/android/PollAttachView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0801fc

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-virtual {v1, v2, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    const/16 v1, -0x2223

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/PollAttachView;->setBackgroundColor(I)V

    .line 74
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/PollAttachView;->addView(Landroid/view/View;)V

    .line 75
    return-void
.end method

.method private unvote()V
    .locals 5

    .prologue
    .line 315
    new-instance v0, Lcom/vkontakte/android/api/polls/PollsDeleteVote;

    iget v1, p0, Lcom/vkontakte/android/PollAttachView;->oid:I

    iget v2, p0, Lcom/vkontakte/android/PollAttachView;->pid:I

    iget v3, p0, Lcom/vkontakte/android/PollAttachView;->userOption:I

    iget-boolean v4, p0, Lcom/vkontakte/android/PollAttachView;->isBoard:Z

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/vkontakte/android/api/polls/PollsDeleteVote;-><init>(IIIZ)V

    new-instance v1, Lcom/vkontakte/android/PollAttachView$4;

    .line 316
    invoke-virtual {p0}, Lcom/vkontakte/android/PollAttachView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/PollAttachView$4;-><init>(Lcom/vkontakte/android/PollAttachView;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/polls/PollsDeleteVote;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 334
    invoke-virtual {p0}, Lcom/vkontakte/android/PollAttachView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 335
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/view/View;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 336
    return-void
.end method

.method private updateText()V
    .locals 12

    .prologue
    const v11, 0x7f100068

    const/4 v9, 0x1

    const v8, 0x7f100069

    const/4 v10, 0x0

    .line 236
    const/4 v3, 0x0

    .line 237
    .local v3, "total":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v4, p0, Lcom/vkontakte/android/PollAttachView;->options:[Lcom/vkontakte/android/api/PollOption;

    array-length v4, v4

    if-ge v0, v4, :cond_2

    .line 238
    iget-object v4, p0, Lcom/vkontakte/android/PollAttachView;->options:[Lcom/vkontakte/android/api/PollOption;

    aget-object v1, v4, v0

    .line 239
    .local v1, "opt":Lcom/vkontakte/android/api/PollOption;
    iget v4, v1, Lcom/vkontakte/android/api/PollOption;->numVotes:I

    add-int/2addr v3, v4

    .line 240
    iget-object v4, p0, Lcom/vkontakte/android/PollAttachView;->optionViews:Ljava/util/ArrayList;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 241
    .local v2, "ov":Landroid/view/View;
    iget v4, p0, Lcom/vkontakte/android/PollAttachView;->userOption:I

    if-eqz v4, :cond_0

    .line 242
    invoke-virtual {v2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, v10}, Landroid/view/View;->setVisibility(I)V

    .line 243
    invoke-virtual {v2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    const-string/jumbo v5, "%.1f%%"

    new-array v6, v9, [Ljava/lang/Object;

    iget v7, v1, Lcom/vkontakte/android/api/PollOption;->percent:F

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    aput-object v7, v6, v10

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 244
    invoke-virtual {v2, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget v6, v1, Lcom/vkontakte/android/api/PollOption;->numVotes:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 250
    :goto_1
    const v4, 0x7f10006b

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iget v5, p0, Lcom/vkontakte/android/PollAttachView;->userOption:I

    iget v6, v1, Lcom/vkontakte/android/api/PollOption;->id:I

    if-ne v5, v6, :cond_1

    sget-object v5, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    :goto_2
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 237
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 246
    :cond_0
    invoke-virtual {v2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    const/4 v5, 0x4

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    .line 247
    invoke-virtual {v2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    const-string/jumbo v5, "%.1f%%"

    new-array v6, v9, [Ljava/lang/Object;

    iget v7, v1, Lcom/vkontakte/android/api/PollOption;->percent:F

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    aput-object v7, v6, v10

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 248
    invoke-virtual {v2, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    const v5, 0x7f080502

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(I)V

    goto :goto_1

    .line 250
    :cond_1
    sget-object v5, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    goto :goto_2

    .line 252
    .end local v1    # "opt":Lcom/vkontakte/android/api/PollOption;
    .end local v2    # "ov":Landroid/view/View;
    :cond_2
    iget-object v5, p0, Lcom/vkontakte/android/PollAttachView;->infoView:Landroid/widget/TextView;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/vkontakte/android/PollAttachView;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    iget-boolean v4, p0, Lcom/vkontakte/android/PollAttachView;->isPublic:Z

    if-eqz v4, :cond_3

    const v4, 0x7f080505

    :goto_3
    invoke-virtual {v7, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v6, ", "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/vkontakte/android/PollAttachView;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0d0042

    new-array v8, v9, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v10

    invoke-virtual {v6, v7, v3, v8}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 253
    return-void

    .line 252
    :cond_3
    const v4, 0x7f080501

    goto :goto_3
.end method

.method private vote(Lcom/vkontakte/android/api/PollOption;)V
    .locals 5
    .param p1, "opt"    # Lcom/vkontakte/android/api/PollOption;

    .prologue
    .line 291
    new-instance v0, Lcom/vkontakte/android/api/polls/PollsAddVote;

    iget v1, p0, Lcom/vkontakte/android/PollAttachView;->oid:I

    iget v2, p0, Lcom/vkontakte/android/PollAttachView;->pid:I

    iget v3, p1, Lcom/vkontakte/android/api/PollOption;->id:I

    iget-boolean v4, p0, Lcom/vkontakte/android/PollAttachView;->isBoard:Z

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/vkontakte/android/api/polls/PollsAddVote;-><init>(IIIZ)V

    new-instance v1, Lcom/vkontakte/android/PollAttachView$3;

    .line 292
    invoke-virtual {p0}, Lcom/vkontakte/android/PollAttachView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, p0, v2, p1}, Lcom/vkontakte/android/PollAttachView$3;-><init>(Lcom/vkontakte/android/PollAttachView;Landroid/content/Context;Lcom/vkontakte/android/api/PollOption;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/polls/PollsAddVote;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 310
    invoke-virtual {p0}, Lcom/vkontakte/android/PollAttachView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 311
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/view/View;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 312
    return-void
.end method


# virtual methods
.method public onLoaded(Ljava/lang/String;I[Lcom/vkontakte/android/api/PollOption;Z)V
    .locals 26
    .param p1, "question"    # Ljava/lang/String;
    .param p2, "uanswer"    # I
    .param p3, "opts"    # [Lcom/vkontakte/android/api/PollOption;
    .param p4, "pub"    # Z

    .prologue
    .line 78
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/PollAttachView;->listener:Lcom/vkontakte/android/PollAttachView$OnDataLoadedListener;

    move-object/from16 v19, v0

    if-eqz v19, :cond_0

    .line 79
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/PollAttachView;->listener:Lcom/vkontakte/android/PollAttachView$OnDataLoadedListener;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    move/from16 v2, p2

    move-object/from16 v3, p3

    move/from16 v4, p4

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/vkontakte/android/PollAttachView$OnDataLoadedListener;->onDataLoaded(Ljava/lang/String;I[Lcom/vkontakte/android/api/PollOption;Z)V

    .line 81
    :cond_0
    move-object/from16 v0, p3

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/PollAttachView;->options:[Lcom/vkontakte/android/api/PollOption;

    .line 82
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/PollAttachView;->question:Ljava/lang/String;

    .line 83
    move/from16 v0, p2

    move-object/from16 v1, p0

    iput v0, v1, Lcom/vkontakte/android/PollAttachView;->userOption:I

    .line 85
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/PollAttachView;->removeAllViews()V

    .line 87
    new-instance v15, Landroid/widget/TextView;

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/PollAttachView;->getContext()Landroid/content/Context;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-direct {v15, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 88
    .local v15, "pqtView":Landroid/widget/TextView;
    const/high16 v19, -0x1000000

    move/from16 v0, v19

    invoke-virtual {v15, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 89
    move-object/from16 v0, p1

    invoke-virtual {v15, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    const/high16 v19, 0x41880000    # 17.0f

    move/from16 v0, v19

    invoke-virtual {v15, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 92
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/vkontakte/android/PollAttachView;->addView(Landroid/view/View;)V

    .line 94
    const/16 v17, 0x0

    .line 95
    .local v17, "total":I
    move-object/from16 v0, p3

    array-length v0, v0

    move/from16 v20, v0

    const/16 v19, 0x0

    :goto_0
    move/from16 v0, v19

    move/from16 v1, v20

    if-ge v0, v1, :cond_1

    aget-object v8, p3, v19

    .line 96
    .local v8, "o":Lcom/vkontakte/android/api/PollOption;
    iget v0, v8, Lcom/vkontakte/android/api/PollOption;->numVotes:I

    move/from16 v21, v0

    add-int v17, v17, v21

    .line 95
    add-int/lit8 v19, v19, 0x1

    goto :goto_0

    .line 99
    .end local v8    # "o":Lcom/vkontakte/android/api/PollOption;
    :cond_1
    new-instance v19, Landroid/widget/TextView;

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/PollAttachView;->getContext()Landroid/content/Context;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/PollAttachView;->infoView:Landroid/widget/TextView;

    .line 100
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/PollAttachView;->infoView:Landroid/widget/TextView;

    move-object/from16 v19, v0

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/PollAttachView;->getResources()Landroid/content/res/Resources;

    move-result-object v20

    const v21, 0x7f0f0118

    invoke-virtual/range {v20 .. v21}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 101
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/PollAttachView;->infoView:Landroid/widget/TextView;

    move-object/from16 v20, v0

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/PollAttachView;->getResources()Landroid/content/res/Resources;

    move-result-object v22

    if-eqz p4, :cond_2

    const v19, 0x7f080505

    :goto_1
    move-object/from16 v0, v22

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v21

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string/jumbo v21, ", "

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/PollAttachView;->getResources()Landroid/content/res/Resources;

    move-result-object v21

    const v22, 0x7f0d0042

    const/16 v23, 0x1

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    aput-object v25, v23, v24

    move-object/from16 v0, v21

    move/from16 v1, v22

    move/from16 v2, v17

    move-object/from16 v3, v23

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 102
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/PollAttachView;->infoView:Landroid/widget/TextView;

    move-object/from16 v19, v0

    const/high16 v20, 0x41700000    # 15.0f

    invoke-virtual/range {v19 .. v20}, Landroid/widget/TextView;->setTextSize(F)V

    .line 103
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/PollAttachView;->infoView:Landroid/widget/TextView;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/PollAttachView;->addView(Landroid/view/View;)V

    .line 105
    const/4 v7, 0x0

    .line 106
    .local v7, "maxvotes":I
    const/4 v6, 0x0

    .line 107
    .local v6, "maxpercent":I
    move-object/from16 v0, p3

    array-length v0, v0

    move/from16 v20, v0

    const/16 v19, 0x0

    :goto_2
    move/from16 v0, v19

    move/from16 v1, v20

    if-ge v0, v1, :cond_3

    aget-object v10, p3, v19

    .line 109
    .local v10, "opt":Lcom/vkontakte/android/api/PollOption;
    iget v0, v10, Lcom/vkontakte/android/api/PollOption;->percent:F

    move/from16 v21, v0

    const/high16 v22, 0x41200000    # 10.0f

    mul-float v21, v21, v22

    move/from16 v0, v21

    float-to-int v0, v0

    move/from16 v21, v0

    move/from16 v0, v21

    invoke-static {v6, v0}, Ljava/lang/Math;->max(II)I

    move-result v6

    move v7, v6

    .line 107
    add-int/lit8 v19, v19, 0x1

    goto :goto_2

    .line 101
    .end local v6    # "maxpercent":I
    .end local v7    # "maxvotes":I
    .end local v10    # "opt":Lcom/vkontakte/android/api/PollOption;
    :cond_2
    const v19, 0x7f080501

    goto/16 :goto_1

    .line 111
    .restart local v6    # "maxpercent":I
    .restart local v7    # "maxvotes":I
    :cond_3
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string/jumbo v20, ""

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v7

    .line 145
    move-object/from16 v0, p3

    array-length v0, v0

    move/from16 v21, v0

    const/16 v19, 0x0

    move/from16 v20, v19

    :goto_3
    move/from16 v0, v20

    move/from16 v1, v21

    if-ge v0, v1, :cond_8

    aget-object v10, p3, v20

    .line 146
    .restart local v10    # "opt":Lcom/vkontakte/android/api/PollOption;
    new-instance v12, Landroid/widget/RelativeLayout;

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/PollAttachView;->getContext()Landroid/content/Context;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-direct {v12, v0}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 147
    .local v12, "pItem":Landroid/widget/RelativeLayout;
    new-instance v19, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v22, -0x1

    const/16 v23, -0x2

    move-object/from16 v0, v19

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 149
    new-instance v5, Landroid/widget/TextView;

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/PollAttachView;->getContext()Landroid/content/Context;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-direct {v5, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 150
    .local v5, "itemTitle":Landroid/widget/TextView;
    const/high16 v19, -0x1000000

    move/from16 v0, v19

    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 151
    iget-object v0, v10, Lcom/vkontakte/android/api/PollOption;->title:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 152
    const v19, 0x7f10006b

    move/from16 v0, v19

    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setId(I)V

    .line 153
    const/16 v19, 0x0

    const/high16 v22, 0x40a00000    # 5.0f

    invoke-static/range {v22 .. v22}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v22

    const/16 v23, 0x0

    const/16 v24, 0x0

    move/from16 v0, v19

    move/from16 v1, v22

    move/from16 v2, v23

    move/from16 v3, v24

    invoke-virtual {v5, v0, v1, v2, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 154
    iget v0, v10, Lcom/vkontakte/android/api/PollOption;->id:I

    move/from16 v19, v0

    move/from16 v0, p2

    move/from16 v1, v19

    if-ne v0, v1, :cond_4

    sget-object v19, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    :goto_4
    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 155
    invoke-virtual {v12, v5}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 157
    new-instance v13, Landroid/widget/ProgressBar;

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/PollAttachView;->getContext()Landroid/content/Context;

    move-result-object v19

    const/16 v22, 0x0

    const v23, 0x1010078

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    move/from16 v2, v23

    invoke-direct {v13, v0, v1, v2}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 158
    .local v13, "pbar":Landroid/widget/ProgressBar;
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/PollAttachView;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v22, 0x7f02039d

    move-object/from16 v0, v19

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v13, v0}, Landroid/widget/ProgressBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 159
    invoke-virtual {v13, v6}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 160
    if-eqz p2, :cond_5

    iget v0, v10, Lcom/vkontakte/android/api/PollOption;->percent:F

    move/from16 v19, v0

    const/high16 v22, 0x41200000    # 10.0f

    mul-float v19, v19, v22

    move/from16 v0, v19

    float-to-int v0, v0

    move/from16 v19, v0

    :goto_5
    move/from16 v0, v19

    invoke-virtual {v13, v0}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 161
    const v19, 0x7f10006a

    move/from16 v0, v19

    invoke-virtual {v13, v0}, Landroid/widget/ProgressBar;->setId(I)V

    .line 162
    new-instance v14, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v19, -0x1

    const/high16 v22, 0x41a00000    # 20.0f

    invoke-static/range {v22 .. v22}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v22

    move/from16 v0, v19

    move/from16 v1, v22

    invoke-direct {v14, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 163
    .local v14, "pparams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v19, 0x3

    const v22, 0x7f10006b

    move/from16 v0, v19

    move/from16 v1, v22

    invoke-virtual {v14, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 164
    const/high16 v19, 0x42480000    # 50.0f

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v19

    move/from16 v0, v19

    iput v0, v14, Landroid/widget/RelativeLayout$LayoutParams;->rightMargin:I

    .line 165
    const/high16 v19, 0x40a00000    # 5.0f

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v19

    move/from16 v0, v19

    iput v0, v14, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 166
    invoke-virtual {v13, v14}, Landroid/widget/ProgressBar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 167
    invoke-virtual {v12, v13}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 169
    new-instance v16, Landroid/widget/TextView;

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/PollAttachView;->getContext()Landroid/content/Context;

    move-result-object v19

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 170
    .local v16, "prView":Landroid/widget/TextView;
    const/high16 v19, -0x1000000

    move-object/from16 v0, v16

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 171
    const/high16 v19, 0x41700000    # 15.0f

    move-object/from16 v0, v16

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 172
    const v19, 0x7f100069

    move-object/from16 v0, v16

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setId(I)V

    .line 173
    const-string/jumbo v19, "%.1f%%"

    const/16 v22, 0x1

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    iget v0, v10, Lcom/vkontakte/android/api/PollOption;->percent:F

    move/from16 v24, v0

    invoke-static/range {v24 .. v24}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v24

    aput-object v24, v22, v23

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 174
    if-eqz p2, :cond_6

    const/16 v19, 0x0

    :goto_6
    move-object/from16 v0, v16

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 175
    new-instance v18, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v19, -0x2

    const/16 v22, -0x2

    move-object/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v22

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 176
    .local v18, "tparams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v19, 0x6

    const v22, 0x7f10006a

    move-object/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 177
    const/16 v19, 0x8

    const v22, 0x7f10006a

    move-object/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 178
    const/16 v19, 0xb

    invoke-virtual/range {v18 .. v19}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 179
    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 180
    move-object/from16 v0, v16

    invoke-virtual {v12, v0}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 182
    new-instance v11, Landroid/widget/TextView;

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/PollAttachView;->getContext()Landroid/content/Context;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-direct {v11, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 183
    .local v11, "overlayView":Landroid/widget/TextView;
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/PollAttachView;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    const v22, 0x7f0f0118

    move-object/from16 v0, v19

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 184
    const/high16 v19, 0x41700000    # 15.0f

    move/from16 v0, v19

    invoke-virtual {v11, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 185
    const v19, 0x7f100068

    move/from16 v0, v19

    invoke-virtual {v11, v0}, Landroid/widget/TextView;->setId(I)V

    .line 186
    const/16 v19, 0x11

    move/from16 v0, v19

    invoke-virtual {v11, v0}, Landroid/widget/TextView;->setGravity(I)V

    .line 187
    if-nez p2, :cond_7

    .line 188
    const v19, 0x7f080502

    move/from16 v0, v19

    invoke-virtual {v11, v0}, Landroid/widget/TextView;->setText(I)V

    .line 192
    :goto_7
    new-instance v9, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v19, -0x2

    const/16 v22, -0x2

    move/from16 v0, v19

    move/from16 v1, v22

    invoke-direct {v9, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 193
    .local v9, "olp":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v19, 0x6

    const v22, 0x7f10006a

    move/from16 v0, v19

    move/from16 v1, v22

    invoke-virtual {v9, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 194
    const/16 v19, 0x8

    const v22, 0x7f10006a

    move/from16 v0, v19

    move/from16 v1, v22

    invoke-virtual {v9, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 195
    const/16 v19, 0x5

    const v22, 0x7f10006a

    move/from16 v0, v19

    move/from16 v1, v22

    invoke-virtual {v9, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 196
    const/16 v19, 0x7

    const v22, 0x7f10006a

    move/from16 v0, v19

    move/from16 v1, v22

    invoke-virtual {v9, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 197
    invoke-virtual {v11, v9}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 198
    invoke-virtual {v12, v11}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 200
    invoke-virtual {v12, v10}, Landroid/widget/RelativeLayout;->setTag(Ljava/lang/Object;)V

    .line 202
    new-instance v19, Lcom/vkontakte/android/PollAttachView$1;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/vkontakte/android/PollAttachView$1;-><init>(Lcom/vkontakte/android/PollAttachView;)V

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 218
    new-instance v19, Lcom/vkontakte/android/PollAttachView$2;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/vkontakte/android/PollAttachView$2;-><init>(Lcom/vkontakte/android/PollAttachView;)V

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Landroid/widget/RelativeLayout;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 229
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/PollAttachView;->optionViews:Ljava/util/ArrayList;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 230
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/vkontakte/android/PollAttachView;->addView(Landroid/view/View;)V

    .line 145
    add-int/lit8 v19, v20, 0x1

    move/from16 v20, v19

    goto/16 :goto_3

    .line 154
    .end local v9    # "olp":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v11    # "overlayView":Landroid/widget/TextView;
    .end local v13    # "pbar":Landroid/widget/ProgressBar;
    .end local v14    # "pparams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v16    # "prView":Landroid/widget/TextView;
    .end local v18    # "tparams":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_4
    sget-object v19, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    goto/16 :goto_4

    .line 160
    .restart local v13    # "pbar":Landroid/widget/ProgressBar;
    :cond_5
    const/16 v19, 0x0

    goto/16 :goto_5

    .line 174
    .restart local v14    # "pparams":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v16    # "prView":Landroid/widget/TextView;
    :cond_6
    const/16 v19, 0x4

    goto/16 :goto_6

    .line 190
    .restart local v11    # "overlayView":Landroid/widget/TextView;
    .restart local v18    # "tparams":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_7
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    iget v0, v10, Lcom/vkontakte/android/api/PollOption;->numVotes:I

    move/from16 v22, v0

    move-object/from16 v0, v19

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string/jumbo v22, ""

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_7

    .line 233
    .end local v5    # "itemTitle":Landroid/widget/TextView;
    .end local v10    # "opt":Lcom/vkontakte/android/api/PollOption;
    .end local v11    # "overlayView":Landroid/widget/TextView;
    .end local v12    # "pItem":Landroid/widget/RelativeLayout;
    .end local v13    # "pbar":Landroid/widget/ProgressBar;
    .end local v14    # "pparams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v16    # "prView":Landroid/widget/TextView;
    .end local v18    # "tparams":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_8
    return-void
.end method

.method public onMeasure(II)V
    .locals 2
    .param p1, "wms"    # I
    .param p2, "hms"    # I

    .prologue
    .line 61
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 62
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    invoke-virtual {p0}, Lcom/vkontakte/android/PollAttachView;->getMeasuredHeight()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/PollAttachView;->setMeasuredDimension(II)V

    .line 63
    return-void
.end method

.method public setOnDataLoadedListener(Lcom/vkontakte/android/PollAttachView$OnDataLoadedListener;)V
    .locals 0
    .param p1, "l"    # Lcom/vkontakte/android/PollAttachView$OnDataLoadedListener;

    .prologue
    .line 339
    iput-object p1, p0, Lcom/vkontakte/android/PollAttachView;->listener:Lcom/vkontakte/android/PollAttachView$OnDataLoadedListener;

    .line 340
    return-void
.end method
