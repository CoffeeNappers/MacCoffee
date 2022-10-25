.class public Lcom/vkontakte/android/fragments/friends/RequestHeaderHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "RequestHeaderHolder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Ljava/lang/CharSequence;",
        ">;"
    }
.end annotation


# instance fields
.field private final counter:Landroid/widget/TextView;

.field private suggestions:Z

.field private final title:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .locals 3
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 20
    const v1, 0x7f0300aa

    invoke-direct {p0, v1, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 21
    const v1, 0x7f100128

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/friends/RequestHeaderHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/fragments/friends/RequestHeaderHolder;->title:Landroid/widget/TextView;

    .line 22
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/RequestHeaderHolder;->title:Landroid/widget/TextView;

    sget-object v2, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    iget-object v2, v2, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 23
    const v1, 0x7f1002b6

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/friends/RequestHeaderHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/fragments/friends/RequestHeaderHolder;->counter:Landroid/widget/TextView;

    .line 24
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/RequestHeaderHolder;->counter:Landroid/widget/TextView;

    sget-object v2, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    iget-object v2, v2, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 25
    const v1, 0x7f1002b7

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/friends/RequestHeaderHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 26
    .local v0, "action":Landroid/widget/TextView;
    sget-object v1, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    iget-object v1, v1, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 27
    invoke-static {p0}, Lcom/vkontakte/android/fragments/friends/RequestHeaderHolder$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/friends/RequestHeaderHolder;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 33
    return-void
.end method


# virtual methods
.method synthetic lambda$new$0(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 28
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 29
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v2, "menu_clear_all"

    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/friends/RequestHeaderHolder;->suggestions:Z

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 30
    const-string/jumbo v1, "suggests"

    iget-boolean v2, p0, Lcom/vkontakte/android/fragments/friends/RequestHeaderHolder;->suggestions:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 31
    const-class v1, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/RequestHeaderHolder;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 32
    return-void

    .line 29
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public onBind(Ljava/lang/CharSequence;)V
    .locals 1
    .param p1, "item"    # Ljava/lang/CharSequence;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/RequestHeaderHolder;->title:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 13
    check-cast p1, Ljava/lang/CharSequence;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/friends/RequestHeaderHolder;->onBind(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setRequestsCount(I)V
    .locals 7
    .param p1, "count"    # I

    .prologue
    const/4 v3, 0x1

    const/4 v6, 0x0

    .line 45
    const v0, 0xf4240

    if-le p1, v0, :cond_0

    .line 46
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/RequestHeaderHolder;->counter:Landroid/widget/TextView;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    const-string/jumbo v2, "%.2fM"

    new-array v3, v3, [Ljava/lang/Object;

    int-to-float v4, p1

    const v5, 0x49742400    # 1000000.0f

    div-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    :goto_0
    return-void

    .line 47
    :cond_0
    const/16 v0, 0x3e8

    if-le p1, v0, :cond_1

    .line 48
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/RequestHeaderHolder;->counter:Landroid/widget/TextView;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    const-string/jumbo v2, "%.2fK"

    new-array v3, v3, [Ljava/lang/Object;

    int-to-float v4, p1

    const/high16 v5, 0x447a0000    # 1000.0f

    div-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 50
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/RequestHeaderHolder;->counter:Landroid/widget/TextView;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method public setShowSuggestions(Z)V
    .locals 0
    .param p1, "show"    # Z

    .prologue
    .line 41
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/friends/RequestHeaderHolder;->suggestions:Z

    .line 42
    return-void
.end method
