.class public Lcom/vkontakte/android/fragments/news/PollEditorFragment;
.super Lme/grishka/appkit/fragments/ContainerFragment;
.source "PollEditorFragment.java"

# interfaces
.implements Landroid/text/TextWatcher;
.implements Landroid/view/View$OnClickListener;
.implements Lcom/vkontakte/android/fragments/BackListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/news/PollEditorFragment$Builder;
    }
.end annotation


# instance fields
.field private editOptions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/attachments/PollAttachment$Answer;",
            ">;"
        }
    .end annotation
.end field

.field mAddButton:Landroid/view/View;

.field mAnonymousSwitch:Landroid/widget/Switch;

.field mAnonymousWrap:Landroid/view/View;

.field mDoneDrawable:Landroid/graphics/drawable/Drawable;

.field mDoneEnabled:Z

.field mDoneItem:Landroid/view/MenuItem;

.field mOptionsRoot:Landroid/view/ViewGroup;

.field mOwnerId:I

.field mPoll:Lcom/vkontakte/android/attachments/PollAttachment;

.field mPreviousHeight:I

.field mRootView:Landroid/view/ViewGroup;

.field mSkipFrame:Z

.field mTitle:Landroid/widget/TextView;

.field private origEditOptions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/attachments/PollAttachment$Answer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 46
    invoke-direct {p0}, Lme/grishka/appkit/fragments/ContainerFragment;-><init>()V

    .line 88
    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mDoneEnabled:Z

    .line 89
    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mSkipFrame:Z

    .line 90
    const/4 v0, -0x1

    iput v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mPreviousHeight:I

    return-void
.end method

.method public static create(I)Lcom/vkontakte/android/fragments/news/PollEditorFragment$Builder;
    .locals 2
    .param p0, "ownerId"    # I

    .prologue
    .line 71
    new-instance v0, Lcom/vkontakte/android/fragments/news/PollEditorFragment$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/news/PollEditorFragment$Builder;-><init>(Lcom/vkontakte/android/fragments/news/PollEditorFragment$1;)V

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment$Builder;->setOwnerId(I)Lcom/vkontakte/android/fragments/news/PollEditorFragment$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static edit(Lcom/vkontakte/android/attachments/PollAttachment;)Lcom/vkontakte/android/fragments/news/PollEditorFragment$Builder;
    .locals 2
    .param p0, "poll"    # Lcom/vkontakte/android/attachments/PollAttachment;

    .prologue
    .line 75
    new-instance v0, Lcom/vkontakte/android/fragments/news/PollEditorFragment$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/news/PollEditorFragment$Builder;-><init>(Lcom/vkontakte/android/fragments/news/PollEditorFragment$1;)V

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment$Builder;->attachPoll(Lcom/vkontakte/android/attachments/PollAttachment;)Lcom/vkontakte/android/fragments/news/PollEditorFragment$Builder;

    move-result-object v0

    return-object v0
.end method

.method private initAnimation()V
    .locals 6

    .prologue
    .line 161
    new-instance v0, Landroid/animation/LayoutTransition;

    invoke-direct {v0}, Landroid/animation/LayoutTransition;-><init>()V

    .line 162
    .local v0, "lt":Landroid/animation/LayoutTransition;
    const/4 v1, 0x1

    const/4 v2, 0x3

    invoke-virtual {v0, v2}, Landroid/animation/LayoutTransition;->getDuration(I)J

    move-result-wide v2

    const-wide/16 v4, 0x3

    div-long/2addr v2, v4

    invoke-virtual {v0, v1, v2, v3}, Landroid/animation/LayoutTransition;->setStartDelay(IJ)V

    .line 163
    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/animation/LayoutTransition;->getDuration(I)J

    move-result-wide v2

    const-wide/16 v4, 0x2

    div-long/2addr v2, v4

    invoke-virtual {v0, v1, v2, v3}, Landroid/animation/LayoutTransition;->setStartDelay(IJ)V

    .line 164
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mOptionsRoot:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    invoke-static {p0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/news/PollEditorFragment;)Landroid/view/ViewTreeObserver$OnPreDrawListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 175
    new-instance v1, Lcom/vkontakte/android/fragments/news/PollEditorFragment$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment$1;-><init>(Lcom/vkontakte/android/fragments/news/PollEditorFragment;)V

    invoke-virtual {v0, v1}, Landroid/animation/LayoutTransition;->addTransitionListener(Landroid/animation/LayoutTransition$TransitionListener;)V

    .line 190
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mOptionsRoot:Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    .line 191
    return-void
.end method

.method private loadPoll()V
    .locals 5

    .prologue
    .line 145
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->editOptions:Ljava/util/List;

    .line 146
    iget-object v3, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->editOptions:Ljava/util/List;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mPoll:Lcom/vkontakte/android/attachments/PollAttachment;

    iget-object v4, v4, Lcom/vkontakte/android/attachments/PollAttachment;->answers:Ljava/util/ArrayList;

    invoke-interface {v3, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 148
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->origEditOptions:Ljava/util/List;

    .line 149
    iget-object v3, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->origEditOptions:Ljava/util/List;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mPoll:Lcom/vkontakte/android/attachments/PollAttachment;

    iget-object v4, v4, Lcom/vkontakte/android/attachments/PollAttachment;->answers:Ljava/util/ArrayList;

    invoke-interface {v3, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 151
    iget-object v3, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mPoll:Lcom/vkontakte/android/attachments/PollAttachment;

    iget-object v1, v3, Lcom/vkontakte/android/attachments/PollAttachment;->answers:Ljava/util/ArrayList;

    .line 152
    .local v1, "answers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/PollAttachment$Answer;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 153
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/PollAttachment$Answer;

    .line 154
    .local v0, "answer":Lcom/vkontakte/android/attachments/PollAttachment$Answer;
    iget-object v3, v0, Lcom/vkontakte/android/attachments/PollAttachment$Answer;->text:Ljava/lang/String;

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->addOptionRow(Ljava/lang/CharSequence;)V

    .line 152
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 156
    .end local v0    # "answer":Lcom/vkontakte/android/attachments/PollAttachment$Answer;
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mTitle:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mPoll:Lcom/vkontakte/android/attachments/PollAttachment;

    iget-object v4, v4, Lcom/vkontakte/android/attachments/PollAttachment;->question:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 157
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->initAnimation()V

    .line 158
    return-void
.end method


# virtual methods
.method addOptionRow(Ljava/lang/CharSequence;)V
    .locals 7
    .param p1, "text"    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const v6, 0x7f1004bf

    const v5, 0x7f1004be

    const/4 v4, 0x0

    .line 295
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0301ae

    iget-object v3, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mOptionsRoot:Landroid/view/ViewGroup;

    invoke-virtual {v1, v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 296
    .local v0, "opt":Landroid/view/View;
    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mOptionsRoot:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 297
    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 298
    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 299
    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 300
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mOptionsRoot:Landroid/view/ViewGroup;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mOptionsRoot:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 301
    check-cast v0, Landroid/view/ViewGroup;

    .end local v0    # "opt":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutTransition()Landroid/animation/LayoutTransition;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/animation/LayoutTransition;->setAnimateParentHierarchy(Z)V

    .line 302
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->updateAddButton()V

    .line 303
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->updateDoneButton()V

    .line 304
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->updateRemoveButtons()V

    .line 305
    return-void
.end method

.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 281
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->updateDoneButton()V

    .line 282
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 238
    return-void
.end method

.method enableDone(Z)V
    .locals 2
    .param p1, "enable"    # Z

    .prologue
    .line 333
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mDoneEnabled:Z

    if-eq p1, v0, :cond_1

    .line 334
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mDoneEnabled:Z

    .line 335
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mDoneDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    .line 336
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mDoneDrawable:Landroid/graphics/drawable/Drawable;

    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mDoneEnabled:Z

    if-eqz v0, :cond_2

    const/16 v0, 0xff

    :goto_0
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 338
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mDoneItem:Landroid/view/MenuItem;

    if-eqz v0, :cond_1

    .line 339
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mDoneItem:Landroid/view/MenuItem;

    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mDoneEnabled:Z

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 342
    :cond_1
    return-void

    .line 336
    :cond_2
    const/16 v0, 0x7f

    goto :goto_0
.end method

.method synthetic lambda$initAnimation$0()Z
    .locals 3

    .prologue
    .line 165
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mOptionsRoot:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getHeight()I

    move-result v0

    .line 166
    .local v0, "h":I
    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mSkipFrame:Z

    if-eqz v1, :cond_0

    .line 167
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mSkipFrame:Z

    .line 168
    iget v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mPreviousHeight:I

    .line 172
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mAnonymousWrap:Landroid/view/View;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mOptionsRoot:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    move-result v2

    sub-int v2, v0, v2

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 173
    const/4 v1, 0x1

    return v1

    .line 170
    :cond_0
    iput v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mPreviousHeight:I

    goto :goto_0
.end method

.method synthetic lambda$onBackPressed$1(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 270
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 271
    return-void
.end method

.method public onBackPressed()Z
    .locals 9

    .prologue
    const v8, 0x7f1004be

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 248
    iget-object v3, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mPoll:Lcom/vkontakte/android/attachments/PollAttachment;

    if-nez v3, :cond_2

    .line 249
    iget-object v3, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_0

    move v0, v4

    .line 250
    .local v0, "changed":Z
    :goto_0
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_1
    iget-object v3, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mOptionsRoot:Landroid/view/ViewGroup;

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-ge v2, v3, :cond_6

    .line 251
    iget-object v3, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mOptionsRoot:Landroid/view/ViewGroup;

    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 252
    .local v1, "child":Landroid/view/View;
    invoke-virtual {v1, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_1

    move v3, v4

    :goto_2
    or-int/2addr v0, v3

    .line 250
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .end local v0    # "changed":Z
    .end local v1    # "child":Landroid/view/View;
    .end local v2    # "i":I
    :cond_0
    move v0, v5

    .line 249
    goto :goto_0

    .restart local v0    # "changed":Z
    .restart local v1    # "child":Landroid/view/View;
    .restart local v2    # "i":I
    :cond_1
    move v3, v5

    .line 252
    goto :goto_2

    .line 255
    .end local v0    # "changed":Z
    .end local v1    # "child":Landroid/view/View;
    .end local v2    # "i":I
    :cond_2
    iget-object v3, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v6, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mPoll:Lcom/vkontakte/android/attachments/PollAttachment;

    iget-object v6, v6, Lcom/vkontakte/android/attachments/PollAttachment;->question:Ljava/lang/String;

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    move v0, v4

    .line 256
    .restart local v0    # "changed":Z
    :goto_3
    iget-object v3, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mOptionsRoot:Landroid/view/ViewGroup;

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    add-int/lit8 v3, v3, -0x2

    iget-object v6, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mPoll:Lcom/vkontakte/android/attachments/PollAttachment;

    iget-object v6, v6, Lcom/vkontakte/android/attachments/PollAttachment;->answers:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-eq v3, v6, :cond_4

    move v3, v4

    :goto_4
    or-int/2addr v0, v3

    .line 257
    if-nez v0, :cond_6

    .line 258
    const/4 v2, 0x1

    .restart local v2    # "i":I
    :goto_5
    iget-object v3, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mOptionsRoot:Landroid/view/ViewGroup;

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-ge v2, v3, :cond_6

    .line 259
    iget-object v3, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mOptionsRoot:Landroid/view/ViewGroup;

    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 260
    .restart local v1    # "child":Landroid/view/View;
    invoke-virtual {v1, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v6

    iget-object v3, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mPoll:Lcom/vkontakte/android/attachments/PollAttachment;

    iget-object v3, v3, Lcom/vkontakte/android/attachments/PollAttachment;->answers:Ljava/util/ArrayList;

    add-int/lit8 v7, v2, -0x1

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/attachments/PollAttachment$Answer;

    iget-object v3, v3, Lcom/vkontakte/android/attachments/PollAttachment$Answer;->text:Ljava/lang/String;

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    move v3, v4

    :goto_6
    or-int/2addr v0, v3

    .line 258
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .end local v0    # "changed":Z
    .end local v1    # "child":Landroid/view/View;
    .end local v2    # "i":I
    :cond_3
    move v0, v5

    .line 255
    goto :goto_3

    .restart local v0    # "changed":Z
    :cond_4
    move v3, v5

    .line 256
    goto :goto_4

    .restart local v1    # "child":Landroid/view/View;
    .restart local v2    # "i":I
    :cond_5
    move v3, v5

    .line 260
    goto :goto_6

    .line 265
    .end local v1    # "child":Landroid/view/View;
    .end local v2    # "i":I
    :cond_6
    if-eqz v0, :cond_7

    .line 266
    new-instance v3, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-direct {v3, v5}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v5, 0x7f080176

    .line 267
    invoke-virtual {v3, v5}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v5, 0x7f08017a

    .line 268
    invoke-virtual {v3, v5}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v5, 0x7f08019c

    invoke-static {p0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/news/PollEditorFragment;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v6

    .line 269
    invoke-virtual {v3, v5, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v5, 0x7f08011f

    const/4 v6, 0x0

    .line 272
    invoke-virtual {v3, v5, v6}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 273
    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 276
    :goto_7
    return v4

    :cond_7
    move v4, v5

    goto :goto_7
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 214
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    .line 233
    :cond_0
    :goto_0
    return-void

    .line 216
    :sswitch_0
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->addOptionRow(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 220
    :sswitch_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mOptionsRoot:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    const/4 v2, 0x3

    if-lt v1, v2, :cond_0

    .line 221
    iget-object v2, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mOptionsRoot:Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 222
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 223
    .local v0, "index":I
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->editOptions:Ljava/util/List;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->editOptions:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 224
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->editOptions:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 226
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->updateAddButton()V

    .line 227
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->updateDoneButton()V

    .line 228
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->updateRemoveButtons()V

    goto :goto_0

    .line 214
    :sswitch_data_0
    .sparse-switch
        0x7f1004ba -> :sswitch_0
        0x7f1004bf -> :sswitch_1
    .end sparse-switch
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 309
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/ContainerFragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 310
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->updateDecorator()V

    .line 311
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 99
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/ContainerFragment;->onCreate(Landroid/os/Bundle;)V

    .line 100
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->setHasOptionsMenu(Z)V

    .line 101
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "poll"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/PollAttachment;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mPoll:Lcom/vkontakte/android/attachments/PollAttachment;

    .line 102
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "oid"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mOwnerId:I

    .line 103
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 3
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    const/4 v2, 0x0

    .line 195
    invoke-super {p0, p1, p2}, Lme/grishka/appkit/fragments/ContainerFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 196
    const v0, 0x7f10001a

    const v1, 0x7f0801c5

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mDoneItem:Landroid/view/MenuItem;

    .line 197
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mDoneItem:Landroid/view/MenuItem;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020184

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mDoneDrawable:Landroid/graphics/drawable/Drawable;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    move-result-object v0

    const/4 v1, 0x2

    .line 198
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 199
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mDoneItem:Landroid/view/MenuItem;

    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mDoneEnabled:Z

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 200
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mDoneDrawable:Landroid/graphics/drawable/Drawable;

    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mDoneEnabled:Z

    if-eqz v0, :cond_0

    const/16 v0, 0xff

    :goto_0
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 202
    return-void

    .line 200
    :cond_0
    const/16 v0, 0x7f

    goto :goto_0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 108
    const v0, 0x7f0301ad

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method onDone()V
    .locals 13

    .prologue
    const v2, 0x7f1004be

    .line 345
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mPoll:Lcom/vkontakte/android/attachments/PollAttachment;

    if-nez v0, :cond_1

    .line 346
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 347
    .local v10, "options":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v9, 0x1

    .local v9, "i":I
    :goto_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mOptionsRoot:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ge v9, v0, :cond_0

    .line 348
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mOptionsRoot:Landroid/view/ViewGroup;

    invoke-virtual {v0, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    .line 349
    .local v8, "child":Landroid/view/View;
    invoke-virtual {v8, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v10, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 347
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 351
    .end local v8    # "child":Landroid/view/View;
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v11

    .line 352
    .local v11, "question":Ljava/lang/String;
    new-instance v0, Lcom/vkontakte/android/api/polls/PollsCreate;

    iget v1, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mOwnerId:I

    iget-object v2, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mAnonymousSwitch:Landroid/widget/Switch;

    invoke-virtual {v2}, Landroid/widget/Switch;->isChecked()Z

    move-result v2

    invoke-direct {v0, v11, v10, v1, v2}, Lcom/vkontakte/android/api/polls/PollsCreate;-><init>(Ljava/lang/String;Ljava/util/List;IZ)V

    new-instance v1, Lcom/vkontakte/android/fragments/news/PollEditorFragment$2;

    invoke-direct {v1, p0, p0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment$2;-><init>(Lcom/vkontakte/android/fragments/news/PollEditorFragment;Landroid/app/Fragment;)V

    .line 353
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/polls/PollsCreate;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 362
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 363
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 401
    .end local v10    # "options":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_1
    return-void

    .line 365
    .end local v9    # "i":I
    .end local v11    # "question":Ljava/lang/String;
    :cond_1
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 366
    .local v5, "remove":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 367
    .local v4, "add":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 368
    .local v6, "edit":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v9, 0x1

    .restart local v9    # "i":I
    :goto_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mOptionsRoot:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ge v9, v0, :cond_4

    .line 369
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mOptionsRoot:Landroid/view/ViewGroup;

    invoke-virtual {v0, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    .line 370
    .restart local v8    # "child":Landroid/view/View;
    invoke-virtual {v8, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v12

    .line 371
    .local v12, "text":Ljava/lang/String;
    add-int/lit8 v0, v9, -0x1

    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->editOptions:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_3

    .line 372
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->editOptions:Ljava/util/List;

    add-int/lit8 v1, v9, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/vkontakte/android/attachments/PollAttachment$Answer;

    .line 373
    .local v7, "answer":Lcom/vkontakte/android/attachments/PollAttachment$Answer;
    iget-object v0, v7, Lcom/vkontakte/android/attachments/PollAttachment$Answer;->text:Ljava/lang/String;

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 374
    iget v0, v7, Lcom/vkontakte/android/attachments/PollAttachment$Answer;->id:I

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 368
    .end local v7    # "answer":Lcom/vkontakte/android/attachments/PollAttachment$Answer;
    :cond_2
    :goto_3
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 377
    :cond_3
    invoke-virtual {v4, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 380
    .end local v8    # "child":Landroid/view/View;
    .end local v12    # "text":Ljava/lang/String;
    :cond_4
    const/4 v9, 0x0

    :goto_4
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->origEditOptions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v9, v0, :cond_6

    .line 381
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->origEditOptions:Ljava/util/List;

    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/vkontakte/android/attachments/PollAttachment$Answer;

    .line 382
    .restart local v7    # "answer":Lcom/vkontakte/android/attachments/PollAttachment$Answer;
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->editOptions:Ljava/util/List;

    invoke-interface {v0, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 383
    iget v0, v7, Lcom/vkontakte/android/attachments/PollAttachment$Answer;->id:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 380
    :cond_5
    add-int/lit8 v9, v9, 0x1

    goto :goto_4

    .line 386
    .end local v7    # "answer":Lcom/vkontakte/android/attachments/PollAttachment$Answer;
    :cond_6
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v11

    .line 387
    .restart local v11    # "question":Ljava/lang/String;
    new-instance v0, Lcom/vkontakte/android/api/polls/PollsEdit;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mPoll:Lcom/vkontakte/android/attachments/PollAttachment;

    iget v1, v1, Lcom/vkontakte/android/attachments/PollAttachment;->oid:I

    iget-object v2, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mPoll:Lcom/vkontakte/android/attachments/PollAttachment;

    iget v2, v2, Lcom/vkontakte/android/attachments/PollAttachment;->pid:I

    iget-object v3, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mPoll:Lcom/vkontakte/android/attachments/PollAttachment;

    iget-object v3, v3, Lcom/vkontakte/android/attachments/PollAttachment;->question:Ljava/lang/String;

    invoke-virtual {v11, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    const/4 v3, 0x0

    :goto_5
    invoke-direct/range {v0 .. v6}, Lcom/vkontakte/android/api/polls/PollsEdit;-><init>(IILjava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/Map;)V

    new-instance v1, Lcom/vkontakte/android/fragments/news/PollEditorFragment$3;

    invoke-direct {v1, p0, p0, v11}, Lcom/vkontakte/android/fragments/news/PollEditorFragment$3;-><init>(Lcom/vkontakte/android/fragments/news/PollEditorFragment;Landroid/app/Fragment;Ljava/lang/String;)V

    .line 388
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/polls/PollsEdit;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 398
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 399
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_1

    :cond_7
    move-object v3, v11

    .line 387
    goto :goto_5
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 206
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f10001a

    if-ne v0, v1, :cond_0

    .line 207
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->onDone()V

    .line 209
    :cond_0
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/ContainerFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 243
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v2, 0x0

    .line 113
    invoke-super {p0, p1, p2}, Lme/grishka/appkit/fragments/ContainerFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 114
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mPoll:Lcom/vkontakte/android/attachments/PollAttachment;

    if-eqz v0, :cond_0

    const v0, 0x7f080504

    :goto_0
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->setTitle(I)V

    .line 115
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    const v1, 0x7f02014f

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(I)V

    .line 116
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 118
    const v0, 0x7f1004ba

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mAddButton:Landroid/view/View;

    .line 119
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mAddButton:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 121
    const v0, 0x7f1004b9

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mOptionsRoot:Landroid/view/ViewGroup;

    .line 122
    const v0, 0x7f1004b7

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mRootView:Landroid/view/ViewGroup;

    .line 124
    const v0, 0x7f1004b8

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mTitle:Landroid/widget/TextView;

    .line 125
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 127
    const v0, 0x7f1004bb

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mAnonymousWrap:Landroid/view/View;

    .line 128
    const v0, 0x7f1004bd

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Switch;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mAnonymousSwitch:Landroid/widget/Switch;

    .line 130
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->updateDecorator()V

    .line 132
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mPoll:Lcom/vkontakte/android/attachments/PollAttachment;

    if-eqz v0, :cond_1

    .line 133
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mAnonymousWrap:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 134
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->loadPoll()V

    .line 141
    :goto_1
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->initAnimation()V

    .line 142
    return-void

    .line 114
    :cond_0
    const v0, 0x7f080503

    goto :goto_0

    .line 136
    :cond_1
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->addOptionRow(Ljava/lang/CharSequence;)V

    .line 137
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->addOptionRow(Ljava/lang/CharSequence;)V

    goto :goto_1
.end method

.method updateAddButton()V
    .locals 3

    .prologue
    .line 291
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mAddButton:Landroid/view/View;

    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mOptionsRoot:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/16 v2, 0xc

    if-ge v0, v2, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 292
    return-void

    .line 291
    :cond_0
    const/16 v0, 0x8

    goto :goto_0
.end method

.method updateDecorator()V
    .locals 9

    .prologue
    const/4 v5, 0x0

    .line 314
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget-object v4, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mRootView:Landroid/view/ViewGroup;

    invoke-virtual {v4}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    if-ge v2, v4, :cond_1

    .line 315
    new-instance v0, Lcom/vkontakte/android/ui/cardview/CardDrawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const/4 v7, -0x1

    const/high16 v4, 0x40000000    # 2.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    int-to-float v8, v4

    iget-boolean v4, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->isTablet:Z

    if-nez v4, :cond_0

    const/4 v4, 0x1

    :goto_1
    invoke-direct {v0, v6, v7, v8, v4}, Lcom/vkontakte/android/ui/cardview/CardDrawable;-><init>(Landroid/content/res/Resources;IFZ)V

    .line 316
    .local v0, "bg":Landroid/graphics/drawable/Drawable;
    iget-object v4, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mRootView:Landroid/view/ViewGroup;

    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 317
    .local v1, "c":Landroid/view/View;
    invoke-static {v1, v0}, Lcom/vkontakte/android/ViewUtils;->setBackgroundWithViewPadding(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 314
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .end local v0    # "bg":Landroid/graphics/drawable/Drawable;
    .end local v1    # "c":Landroid/view/View;
    :cond_0
    move v4, v5

    .line 315
    goto :goto_1

    .line 319
    :cond_1
    iget v4, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->scrW:I

    const/16 v6, 0x39c

    if-lt v4, v6, :cond_2

    const/high16 v4, 0x42000000    # 32.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    .line 320
    .local v3, "pad":I
    :goto_2
    iget-object v4, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mRootView:Landroid/view/ViewGroup;

    invoke-virtual {v4, v3, v5, v3, v5}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 321
    return-void

    .end local v3    # "pad":I
    :cond_2
    move v3, v5

    .line 319
    goto :goto_2
.end method

.method updateDoneButton()V
    .locals 6

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 324
    iget-object v3, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_0

    move v1, v4

    .line 325
    .local v1, "disable":Z
    :goto_0
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_1
    iget-object v3, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mOptionsRoot:Landroid/view/ViewGroup;

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-ge v2, v3, :cond_2

    .line 326
    iget-object v3, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mOptionsRoot:Landroid/view/ViewGroup;

    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 327
    .local v0, "child":Landroid/view/View;
    const v3, 0x7f1004be

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_1

    move v3, v4

    :goto_2
    or-int/2addr v1, v3

    .line 325
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .end local v0    # "child":Landroid/view/View;
    .end local v1    # "disable":Z
    .end local v2    # "i":I
    :cond_0
    move v1, v5

    .line 324
    goto :goto_0

    .restart local v0    # "child":Landroid/view/View;
    .restart local v1    # "disable":Z
    .restart local v2    # "i":I
    :cond_1
    move v3, v5

    .line 327
    goto :goto_2

    .line 329
    .end local v0    # "child":Landroid/view/View;
    :cond_2
    if-nez v1, :cond_3

    :goto_3
    invoke-virtual {p0, v4}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->enableDone(Z)V

    .line 330
    return-void

    :cond_3
    move v4, v5

    .line 329
    goto :goto_3
.end method

.method updateRemoveButtons()V
    .locals 4

    .prologue
    .line 285
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mOptionsRoot:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_1

    .line 286
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mOptionsRoot:Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    const v2, 0x7f1004bf

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->mOptionsRoot:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    const/4 v3, 0x4

    if-lt v1, v3, :cond_0

    const/4 v1, 0x0

    :goto_1
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 285
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 286
    :cond_0
    const/16 v1, 0x8

    goto :goto_1

    .line 288
    :cond_1
    return-void
.end method
