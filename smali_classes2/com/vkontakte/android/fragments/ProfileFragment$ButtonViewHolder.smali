.class Lcom/vkontakte/android/fragments/ProfileFragment$ButtonViewHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "ProfileFragment.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ButtonViewHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/fragments/ProfileFragment$ButtonItem;",
        ">;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Clickable;"
    }
.end annotation


# instance fields
.field buttonItem:Lcom/vkontakte/android/fragments/ProfileFragment$ButtonItem;

.field textView:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V
    .locals 1
    .param p2, "view"    # Landroid/view/View;

    .prologue
    .line 3755
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ButtonViewHolder;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    .line 3756
    invoke-direct {p0, p2}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(Landroid/view/View;)V

    .line 3757
    const v0, 0x1020014

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ButtonViewHolder;->textView:Landroid/widget/TextView;

    .line 3758
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/fragments/ProfileFragment$ButtonItem;)V
    .locals 5
    .param p1, "item"    # Lcom/vkontakte/android/fragments/ProfileFragment$ButtonItem;

    .prologue
    .line 3762
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 3763
    .local v0, "builder":Landroid/text/SpannableStringBuilder;
    new-instance v1, Landroid/text/style/ImageSpan;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment$ButtonViewHolder;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f020188

    const/4 v4, 0x1

    invoke-direct {v1, v2, v3, v4}, Landroid/text/style/ImageSpan;-><init>(Landroid/content/Context;II)V

    .line 3765
    .local v1, "imageSpan":Landroid/text/style/ImageSpan;
    iget-object v2, p1, Lcom/vkontakte/android/fragments/ProfileFragment$ButtonItem;->title:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v2

    const-string/jumbo v3, "   "

    invoke-virtual {v2, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 3766
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v3

    const/16 v4, 0x21

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 3767
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ButtonViewHolder;->textView:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3768
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ButtonViewHolder;->buttonItem:Lcom/vkontakte/android/fragments/ProfileFragment$ButtonItem;

    .line 3769
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 3750
    check-cast p1, Lcom/vkontakte/android/fragments/ProfileFragment$ButtonItem;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$ButtonViewHolder;->onBind(Lcom/vkontakte/android/fragments/ProfileFragment$ButtonItem;)V

    return-void
.end method

.method public onClick()V
    .locals 3

    .prologue
    .line 3773
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment$ButtonViewHolder;->getContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/vkontakte/android/LinkRedirActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 3774
    .local v0, "intent":Landroid/content/Intent;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "https://vk.com/app"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ButtonViewHolder;->buttonItem:Lcom/vkontakte/android/fragments/ProfileFragment$ButtonItem;

    iget v2, v2, Lcom/vkontakte/android/fragments/ProfileFragment$ButtonItem;->appId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ButtonViewHolder;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$100(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 3775
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ButtonViewHolder;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->startActivity(Landroid/content/Intent;)V

    .line 3776
    return-void
.end method
