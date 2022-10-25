.class public Lcom/vkontakte/android/ui/controllers/ReplyBarController;
.super Ljava/lang/Object;
.source "ReplyBarController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/controllers/ReplyBarController$Delegate;
    }
.end annotation


# instance fields
.field private delegate:Lcom/vkontakte/android/ui/controllers/ReplyBarController$Delegate;

.field private fromName:Ljava/lang/String;

.field private fromYourName:Z

.field private ownerId:I

.field private replyBarView:Landroid/view/View;

.field private replyToName:Ljava/lang/String;

.field private restrictToCurrentGroup:Z

.field private textViewFrom:Lcom/vkontakte/android/ui/TextView;

.field private textViewTo:Lcom/vkontakte/android/ui/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;IZLcom/vkontakte/android/ui/controllers/ReplyBarController$Delegate;)V
    .locals 2
    .param p1, "replyBarView"    # Landroid/view/View;
    .param p2, "ownerId"    # I
    .param p3, "restrictToCurrentGroup"    # Z
    .param p4, "delegate"    # Lcom/vkontakte/android/ui/controllers/ReplyBarController$Delegate;

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->replyToName:Ljava/lang/String;

    .line 46
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->fromName:Ljava/lang/String;

    .line 48
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->fromYourName:Z

    .line 57
    iput-object p1, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->replyBarView:Landroid/view/View;

    .line 59
    iput p2, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->ownerId:I

    .line 61
    iput-boolean p3, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->restrictToCurrentGroup:Z

    .line 63
    new-instance v0, Lcom/vkontakte/android/ui/controllers/ReplyBarController$1;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/ui/controllers/ReplyBarController$1;-><init>(Lcom/vkontakte/android/ui/controllers/ReplyBarController;Landroid/view/View;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 76
    iput-object p4, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->delegate:Lcom/vkontakte/android/ui/controllers/ReplyBarController$Delegate;

    .line 78
    const v0, 0x7f100519

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->textViewTo:Lcom/vkontakte/android/ui/TextView;

    .line 80
    const v0, 0x7f10051a

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->textViewFrom:Lcom/vkontakte/android/ui/TextView;

    .line 82
    iget-object v0, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->textViewTo:Lcom/vkontakte/android/ui/TextView;

    new-instance v1, Lcom/vkontakte/android/ui/controllers/ReplyBarController$2;

    invoke-direct {v1, p0, p4}, Lcom/vkontakte/android/ui/controllers/ReplyBarController$2;-><init>(Lcom/vkontakte/android/ui/controllers/ReplyBarController;Lcom/vkontakte/android/ui/controllers/ReplyBarController$Delegate;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 93
    iget-object v0, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->textViewFrom:Lcom/vkontakte/android/ui/TextView;

    new-instance v1, Lcom/vkontakte/android/ui/controllers/ReplyBarController$3;

    invoke-direct {v1, p0, p4}, Lcom/vkontakte/android/ui/controllers/ReplyBarController$3;-><init>(Lcom/vkontakte/android/ui/controllers/ReplyBarController;Lcom/vkontakte/android/ui/controllers/ReplyBarController$Delegate;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 101
    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 103
    invoke-direct {p0}, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->initReplyBar()V

    .line 104
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/ui/controllers/ReplyBarController;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/controllers/ReplyBarController;

    .prologue
    .line 38
    invoke-direct {p0}, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->updateMaxWidth()V

    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/ui/controllers/ReplyBarController;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/controllers/ReplyBarController;

    .prologue
    .line 38
    iget v0, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->ownerId:I

    return v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/ui/controllers/ReplyBarController;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/controllers/ReplyBarController;
    .param p1, "x1"    # Z

    .prologue
    .line 38
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->doInit(Z)V

    return-void
.end method

.method private doInit(Z)V
    .locals 2
    .param p1, "enabled"    # Z

    .prologue
    const/16 v1, 0x8

    .line 159
    if-eqz p1, :cond_0

    .line 160
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->setFromYouAsName()V

    .line 165
    :goto_0
    return-void

    .line 162
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->replyBarView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 163
    iget-object v0, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->delegate:Lcom/vkontakte/android/ui/controllers/ReplyBarController$Delegate;

    invoke-interface {v0, v1}, Lcom/vkontakte/android/ui/controllers/ReplyBarController$Delegate;->onViewVisibilityChanged(I)V

    goto :goto_0
.end method

.method private getSpannableWithHighlightedName(ILjava/lang/String;Z)Landroid/text/SpannableStringBuilder;
    .locals 10
    .param p1, "resourceId"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "addCommunityIcon"    # Z

    .prologue
    const/4 v9, 0x0

    .line 245
    iget-object v6, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->replyBarView:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 247
    .local v1, "formattedStr":Ljava/lang/String;
    const-string/jumbo v6, "%s"

    invoke-virtual {v1, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    .line 248
    .local v3, "indNameStart":I
    add-int/lit8 v2, v3, 0x2

    .line 250
    .local v2, "indNameEnd":I
    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    aput-object p2, v6, v9

    invoke-static {v1, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 252
    .local v5, "str":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v7

    sub-int/2addr v6, v7

    add-int/2addr v2, v6

    .line 254
    new-instance v4, Landroid/text/SpannableStringBuilder;

    invoke-direct {v4, v5}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 256
    .local v4, "ssb":Landroid/text/SpannableStringBuilder;
    new-instance v6, Lcom/vkontakte/android/ui/Font$TypefaceSpan;

    sget-object v7, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    const v8, -0xae7e48

    invoke-direct {v6, v7, v8}, Lcom/vkontakte/android/ui/Font$TypefaceSpan;-><init>(Lcom/vkontakte/android/ui/Font;I)V

    invoke-virtual {v4, v6, v3, v2, v9}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 258
    if-eqz p3, :cond_0

    .line 259
    const-string/jumbo v6, "A "

    invoke-virtual {v4, v3, v6}, Landroid/text/SpannableStringBuilder;->insert(ILjava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 260
    iget-object v6, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->replyBarView:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f020190

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 261
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v6

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v7

    invoke-virtual {v0, v9, v9, v6, v7}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 262
    new-instance v6, Landroid/text/style/ImageSpan;

    invoke-direct {v6, v0, v9}, Landroid/text/style/ImageSpan;-><init>(Landroid/graphics/drawable/Drawable;I)V

    add-int/lit8 v7, v3, 0x1

    invoke-virtual {v4, v6, v3, v7, v9}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 265
    .end local v0    # "d":Landroid/graphics/drawable/Drawable;
    :cond_0
    return-object v4
.end method

.method private initReplyBar()V
    .locals 2

    .prologue
    .line 109
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->restrictToCurrentGroup:Z

    if-eqz v0, :cond_0

    .line 110
    const/4 v0, 0x2

    new-instance v1, Lcom/vkontakte/android/ui/controllers/ReplyBarController$4;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/ui/controllers/ReplyBarController$4;-><init>(Lcom/vkontakte/android/ui/controllers/ReplyBarController;)V

    invoke-static {v0, v1}, Lcom/vkontakte/android/data/Groups;->getGroups(ILcom/vkontakte/android/data/Groups$GetGroupsCallback;)V

    .line 156
    :goto_0
    return-void

    .line 139
    :cond_0
    invoke-static {}, Lcom/vk/sharing/target/GroupsForCommentsImpersonation;->getInstance()Lcom/vk/sharing/target/GroupsForCommentsImpersonation;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/ui/controllers/ReplyBarController$5;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/ui/controllers/ReplyBarController$5;-><init>(Lcom/vkontakte/android/ui/controllers/ReplyBarController;)V

    invoke-virtual {v0, v1}, Lcom/vk/sharing/target/GroupsForCommentsImpersonation;->load(Lcom/vkontakte/android/api/Callback;)V

    goto :goto_0
.end method

.method private updateMaxWidth()V
    .locals 8

    .prologue
    const v4, 0x7fffffff

    .line 210
    iget-object v3, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->textViewTo:Lcom/vkontakte/android/ui/TextView;

    invoke-virtual {v3}, Lcom/vkontakte/android/ui/TextView;->getMaxWidth()I

    move-result v0

    .line 212
    .local v0, "currentMaxWidth":I
    iget-object v3, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->textViewTo:Lcom/vkontakte/android/ui/TextView;

    invoke-virtual {v3}, Lcom/vkontakte/android/ui/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-lez v3, :cond_1

    iget-object v3, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->textViewFrom:Lcom/vkontakte/android/ui/TextView;

    invoke-virtual {v3}, Lcom/vkontakte/android/ui/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-lez v3, :cond_1

    .line 214
    iget-object v3, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->replyBarView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v1

    .line 216
    .local v1, "currentWidth":I
    if-lez v1, :cond_0

    .line 218
    iget-object v3, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->replyBarView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v3

    int-to-double v4, v3

    const-wide v6, 0x3fe4cccccccccccdL    # 0.65

    mul-double/2addr v4, v6

    double-to-int v2, v4

    .line 219
    .local v2, "newMaxWidth":I
    if-eq v2, v0, :cond_0

    .line 220
    iget-object v3, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->textViewTo:Lcom/vkontakte/android/ui/TextView;

    invoke-virtual {v3, v2}, Lcom/vkontakte/android/ui/TextView;->setMaxWidth(I)V

    .line 226
    .end local v1    # "currentWidth":I
    .end local v2    # "newMaxWidth":I
    :cond_0
    :goto_0
    return-void

    .line 223
    :cond_1
    if-eq v4, v0, :cond_0

    .line 224
    iget-object v3, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->textViewTo:Lcom/vkontakte/android/ui/TextView;

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/ui/TextView;->setMaxWidth(I)V

    goto :goto_0
.end method

.method private updateTextViewFrom()V
    .locals 4

    .prologue
    .line 229
    iget-object v0, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->fromName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 230
    iget-object v1, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->textViewFrom:Lcom/vkontakte/android/ui/TextView;

    const v2, 0x7f080161

    iget-object v3, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->fromName:Ljava/lang/String;

    iget-boolean v0, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->fromYourName:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-direct {p0, v2, v3, v0}, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->getSpannableWithHighlightedName(ILjava/lang/String;Z)Landroid/text/SpannableStringBuilder;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/ui/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 234
    :goto_1
    return-void

    .line 230
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 232
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->textViewFrom:Lcom/vkontakte/android/ui/TextView;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1
.end method

.method private updateTextViewTo()V
    .locals 4

    .prologue
    .line 237
    iget-object v0, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->replyToName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 238
    iget-object v0, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->textViewTo:Lcom/vkontakte/android/ui/TextView;

    const v1, 0x7f080165

    iget-object v2, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->replyToName:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-direct {p0, v1, v2, v3}, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->getSpannableWithHighlightedName(ILjava/lang/String;Z)Landroid/text/SpannableStringBuilder;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 242
    :goto_0
    return-void

    .line 240
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->textViewTo:Lcom/vkontakte/android/ui/TextView;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method private updateView()V
    .locals 5

    .prologue
    const/16 v3, 0x8

    const/4 v1, 0x0

    .line 195
    invoke-direct {p0}, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->updateTextViewTo()V

    .line 196
    invoke-direct {p0}, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->updateTextViewFrom()V

    .line 198
    iget-object v2, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->textViewTo:Lcom/vkontakte/android/ui/TextView;

    invoke-virtual {v2}, Lcom/vkontakte/android/ui/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-gtz v2, :cond_0

    iget-object v2, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->textViewFrom:Lcom/vkontakte/android/ui/TextView;

    invoke-virtual {v2}, Lcom/vkontakte/android/ui/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-lez v2, :cond_1

    :cond_0
    const/4 v0, 0x1

    .line 200
    .local v0, "show":Z
    :goto_0
    invoke-direct {p0}, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->updateMaxWidth()V

    .line 202
    iget-object v4, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->replyBarView:Landroid/view/View;

    if-eqz v0, :cond_2

    move v2, v1

    :goto_1
    invoke-static {v4, v2}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 204
    iget-object v2, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->delegate:Lcom/vkontakte/android/ui/controllers/ReplyBarController$Delegate;

    if-eqz v0, :cond_3

    :goto_2
    invoke-interface {v2, v1}, Lcom/vkontakte/android/ui/controllers/ReplyBarController$Delegate;->onViewVisibilityChanged(I)V

    .line 205
    return-void

    .end local v0    # "show":Z
    :cond_1
    move v0, v1

    .line 198
    goto :goto_0

    .restart local v0    # "show":Z
    :cond_2
    move v2, v3

    .line 202
    goto :goto_1

    :cond_3
    move v1, v3

    .line 204
    goto :goto_2
.end method


# virtual methods
.method public resetReplyToName()V
    .locals 1

    .prologue
    .line 174
    const-string/jumbo v0, ""

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->setReplyToName(Ljava/lang/String;)V

    .line 175
    return-void
.end method

.method public setFromName(Ljava/lang/String;)V
    .locals 1
    .param p1, "fromName"    # Ljava/lang/String;

    .prologue
    .line 186
    if-nez p1, :cond_0

    .line 187
    const-string/jumbo p1, ""

    .line 189
    :cond_0
    iput-object p1, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->fromName:Ljava/lang/String;

    .line 190
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->fromYourName:Z

    .line 191
    invoke-direct {p0}, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->updateView()V

    .line 192
    return-void
.end method

.method public setFromYouAsName()V
    .locals 2

    .prologue
    .line 168
    iget-object v0, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->replyBarView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f080163

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->fromName:Ljava/lang/String;

    .line 169
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->fromYourName:Z

    .line 170
    invoke-direct {p0}, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->updateView()V

    .line 171
    return-void
.end method

.method public setReplyToName(Ljava/lang/String;)V
    .locals 0
    .param p1, "replyToName"    # Ljava/lang/String;

    .prologue
    .line 178
    if-nez p1, :cond_0

    .line 179
    const-string/jumbo p1, ""

    .line 181
    :cond_0
    iput-object p1, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->replyToName:Ljava/lang/String;

    .line 182
    invoke-direct {p0}, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->updateView()V

    .line 183
    return-void
.end method
