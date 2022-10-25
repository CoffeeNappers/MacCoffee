.class public Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;
.super Lcom/vkontakte/android/ui/posts/PostDisplayItem;
.source "TextPostDisplayItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/posts/TextPostDisplayItem$ViewHolder;
    }
.end annotation


# instance fields
.field public clickableLinks:Z

.field public expanded:Z

.field public fullText:Ljava/lang/String;

.field public gray:Z

.field public final postInteract:Lcom/vkontakte/android/data/PostInteract;

.field public text:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(IILjava/lang/CharSequence;Ljava/lang/String;ZZLcom/vkontakte/android/data/PostInteract;)V
    .locals 1
    .param p1, "_postID"    # I
    .param p2, "_postOwnerID"    # I
    .param p3, "_text"    # Ljava/lang/CharSequence;
    .param p4, "_fullText"    # Ljava/lang/String;
    .param p5, "_gray"    # Z
    .param p6, "_clickableLinks"    # Z
    .param p7, "postInteract"    # Lcom/vkontakte/android/data/PostInteract;

    .prologue
    .line 26
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/ui/posts/PostDisplayItem;-><init>(II)V

    .line 21
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;->expanded:Z

    .line 27
    iput-object p3, p0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;->text:Ljava/lang/CharSequence;

    .line 28
    iput-boolean p5, p0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;->gray:Z

    .line 29
    iput-boolean p6, p0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;->clickableLinks:Z

    .line 30
    iput-object p4, p0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;->fullText:Ljava/lang/String;

    .line 31
    iput-object p7, p0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    .line 32
    return-void
.end method

.method public static createView(Landroid/content/Context;Z)Landroid/view/View;
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "clickableLinks"    # Z

    .prologue
    const/4 v4, 0x0

    .line 67
    const v3, 0x7f030166

    invoke-static {p0, v3, v4}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 68
    .local v2, "view":Landroid/view/View;
    new-instance v0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem$ViewHolder;

    invoke-direct {v0, v4}, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem$ViewHolder;-><init>(Lcom/vkontakte/android/ui/posts/TextPostDisplayItem$1;)V

    .line 69
    .local v0, "holder":Lcom/vkontakte/android/ui/posts/TextPostDisplayItem$ViewHolder;
    const v3, 0x7f10027b

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, v0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem$ViewHolder;->text:Landroid/widget/TextView;

    .line 70
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string/jumbo v4, "fontSize"

    const-string/jumbo v5, "0"

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 71
    .local v1, "k":I
    iget-object v3, v0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem$ViewHolder;->text:Landroid/widget/TextView;

    const/4 v4, 0x1

    const/high16 v5, 0x41700000    # 15.0f

    int-to-float v6, v1

    const/high16 v7, 0x40000000    # 2.0f

    mul-float/2addr v6, v7

    add-float/2addr v5, v6

    invoke-virtual {v3, v4, v5}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 72
    iget-object v3, v0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem$ViewHolder;->text:Landroid/widget/TextView;

    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setTextIsSelectable(Z)V

    .line 73
    invoke-virtual {v2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 74
    return-object v2
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 41
    if-ne p1, p0, :cond_1

    .line 47
    :cond_0
    :goto_0
    return v1

    .line 43
    :cond_1
    instance-of v3, p1, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;

    if-eqz v3, :cond_3

    move-object v0, p1

    .line 44
    check-cast v0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;

    .line 45
    .local v0, "newItem":Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;
    iget v3, v0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;->postID:I

    iget v4, p0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;->postID:I

    if-ne v3, v4, :cond_2

    iget v3, v0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;->postOwnerID:I

    iget v4, p0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;->postOwnerID:I

    if-ne v3, v4, :cond_2

    iget-object v3, v0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;->text:Ljava/lang/CharSequence;

    iget-object v4, p0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;->text:Ljava/lang/CharSequence;

    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    :cond_2
    move v1, v2

    goto :goto_0

    .end local v0    # "newItem":Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;
    :cond_3
    move v1, v2

    .line 47
    goto :goto_0
.end method

.method public expandText()Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;
    .locals 8

    .prologue
    .line 91
    new-instance v0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;

    iget v1, p0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;->postID:I

    iget v2, p0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;->postOwnerID:I

    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;->fullText:Ljava/lang/String;

    const/4 v4, 0x7

    iget-object v5, p0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    .line 92
    invoke-static {v3, v4, v5}, Lcom/vkontakte/android/LinkParser;->parseLinks(Ljava/lang/CharSequence;ILcom/vkontakte/android/data/PostInteract;)Ljava/lang/CharSequence;

    move-result-object v3

    .line 91
    invoke-static {v3}, Lcom/vkontakte/android/Global;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v3

    const/4 v4, 0x0

    iget-boolean v5, p0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;->gray:Z

    iget-boolean v6, p0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;->clickableLinks:Z

    iget-object v7, p0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    invoke-direct/range {v0 .. v7}, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;-><init>(IILjava/lang/CharSequence;Ljava/lang/String;ZZLcom/vkontakte/android/data/PostInteract;)V

    return-object v0
.end method

.method public getImageCount()I
    .locals 1

    .prologue
    .line 58
    const/4 v0, 0x0

    return v0
.end method

.method public getImageURL(I)Ljava/lang/String;
    .locals 1
    .param p1, "image"    # I

    .prologue
    .line 63
    const/4 v0, 0x0

    return-object v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 53
    const/4 v0, 0x2

    return v0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 36
    iget v0, p0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;->postID:I

    iget v1, p0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;->postOwnerID:I

    mul-int/lit8 v1, v1, 0x7

    add-int/2addr v0, v1

    return v0
.end method

.method public onBindView(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 79
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem$ViewHolder;

    .line 80
    .local v0, "holder":Lcom/vkontakte/android/ui/posts/TextPostDisplayItem$ViewHolder;
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;->text:Ljava/lang/CharSequence;

    iget-object v2, v0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem$ViewHolder;->text:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 81
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem$ViewHolder;->text:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;->text:Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    :cond_0
    iget-boolean v1, p0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;->gray:Z

    if-eqz v1, :cond_1

    .line 84
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem$ViewHolder;->text:Landroid/widget/TextView;

    const/high16 v2, 0x55000000

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 88
    :goto_0
    return-void

    .line 86
    :cond_1
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem$ViewHolder;->text:Landroid/widget/TextView;

    const/high16 v2, -0x1000000

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0
.end method
