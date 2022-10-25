.class public Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "DocumentHolder.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;
.implements Lme/grishka/appkit/views/UsableRecyclerView$LongClickable;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/vkontakte/android/api/BaseDocument;",
        ">",
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<TT;>;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Clickable;",
        "Lme/grishka/appkit/views/UsableRecyclerView$LongClickable;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field protected final info:Landroid/widget/TextView;

.field protected final thumb:Lcom/vk/imageloader/view/VKImageView;

.field protected final title:Landroid/widget/TextView;

.field protected final type:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 29
    .local p0, "this":Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;, "Lcom/vkontakte/android/ui/holder/documents/DocumentHolder<TT;>;"
    const v0, 0x7f030092

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/content/Context;)V

    .line 30
    const v0, 0x7f10028a

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;->title:Landroid/widget/TextView;

    .line 31
    const v0, 0x7f100289

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;->type:Landroid/widget/TextView;

    .line 32
    const v0, 0x7f10028b

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;->info:Landroid/widget/TextView;

    .line 33
    const v0, 0x7f10028c

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;->thumb:Lcom/vk/imageloader/view/VKImageView;

    .line 34
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/api/BaseDocument;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 38
    .local p0, "this":Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;, "Lcom/vkontakte/android/ui/holder/documents/DocumentHolder<TT;>;"
    .local p1, "doc":Lcom/vkontakte/android/api/BaseDocument;, "TT;"
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;->title:Landroid/widget/TextView;

    invoke-interface {p1}, Lcom/vkontakte/android/api/BaseDocument;->getTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;->type:Landroid/widget/TextView;

    invoke-interface {p1}, Lcom/vkontakte/android/api/BaseDocument;->getExt()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {p1}, Lcom/vkontakte/android/api/BaseDocument;->getExt()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;->info:Landroid/widget/TextView;

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;->setInfo(Landroid/widget/TextView;Lcom/vkontakte/android/api/BaseDocument;)V

    .line 41
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 19
    .local p0, "this":Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;, "Lcom/vkontakte/android/ui/holder/documents/DocumentHolder<TT;>;"
    check-cast p1, Lcom/vkontakte/android/api/BaseDocument;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;->onBind(Lcom/vkontakte/android/api/BaseDocument;)V

    return-void
.end method

.method public onClick()V
    .locals 0

    .prologue
    .line 49
    .local p0, "this":Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;, "Lcom/vkontakte/android/ui/holder/documents/DocumentHolder<TT;>;"
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 58
    .local p0, "this":Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;, "Lcom/vkontakte/android/ui/holder/documents/DocumentHolder<TT;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;->onClick()V

    .line 59
    return-void
.end method

.method public onLongClick()Z
    .locals 1

    .prologue
    .line 53
    .local p0, "this":Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;, "Lcom/vkontakte/android/ui/holder/documents/DocumentHolder<TT;>;"
    const/4 v0, 0x0

    return v0
.end method

.method protected setInfo(Landroid/widget/TextView;Lcom/vkontakte/android/api/BaseDocument;)V
    .locals 4
    .param p1, "info"    # Landroid/widget/TextView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/TextView;",
            "TT;)V"
        }
    .end annotation

    .prologue
    .line 44
    .local p0, "this":Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;, "Lcom/vkontakte/android/ui/holder/documents/DocumentHolder<TT;>;"
    .local p2, "doc":Lcom/vkontakte/android/api/BaseDocument;, "TT;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p2}, Lcom/vkontakte/android/api/BaseDocument;->getSize()I

    move-result v1

    int-to-long v2, v1

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v2, v3, v1}, Lcom/vkontakte/android/Global;->langFileSize(JLandroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " \u00b7 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {p2}, Lcom/vkontakte/android/api/BaseDocument;->getDate()I

    move-result v1

    invoke-static {v1}, Lcom/vkontakte/android/TimeUtils;->langDate(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    return-void
.end method
