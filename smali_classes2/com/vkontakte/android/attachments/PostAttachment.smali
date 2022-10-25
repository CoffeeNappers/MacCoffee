.class public Lcom/vkontakte/android/attachments/PostAttachment;
.super Lcom/vkontakte/android/attachments/Attachment;
.source "PostAttachment.java"


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/attachments/PostAttachment;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public post:Lcom/vkontakte/android/NewsEntry;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 28
    new-instance v0, Lcom/vkontakte/android/attachments/PostAttachment$1;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/PostAttachment$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/attachments/PostAttachment;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/NewsEntry;)V
    .locals 0
    .param p1, "entry"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 25
    iput-object p1, p0, Lcom/vkontakte/android/attachments/PostAttachment;->post:Lcom/vkontakte/android/NewsEntry;

    .line 26
    return-void
.end method


# virtual methods
.method public getFullView(Landroid/content/Context;)Landroid/view/View;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 50
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/vkontakte/android/attachments/PostAttachment;->getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "reuse"    # Landroid/view/View;

    .prologue
    .line 55
    if-nez p2, :cond_1

    const-string/jumbo v1, "common"

    invoke-static {p1, v1}, Lcom/vkontakte/android/attachments/PostAttachment;->getReusableView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    .line 56
    .local v0, "v":Landroid/view/View;
    :goto_0
    const v1, 0x7f1001ef

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    const v2, 0x7f010011

    invoke-static {p1, v2}, Lcom/vkontakte/android/ViewUtils;->getResFromTheme(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 57
    const v1, 0x7f1001dc

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0800dc

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    iget-object v1, p0, Lcom/vkontakte/android/attachments/PostAttachment;->post:Lcom/vkontakte/android/NewsEntry;

    if-eqz v1, :cond_0

    .line 59
    const v1, 0x7f1001dd

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/vkontakte/android/attachments/PostAttachment;->post:Lcom/vkontakte/android/NewsEntry;

    iget-object v2, v2, Lcom/vkontakte/android/NewsEntry;->displayablePreviewText:Ljava/lang/CharSequence;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/vkontakte/android/attachments/PostAttachment;->post:Lcom/vkontakte/android/NewsEntry;

    iget-object v2, v2, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    .line 60
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_2

    iget-object v2, p0, Lcom/vkontakte/android/attachments/PostAttachment;->post:Lcom/vkontakte/android/NewsEntry;

    iget-object v2, v2, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-static {v2}, Lcom/vkontakte/android/attachments/Attachment;->getLocalizedDescription(Ljava/util/List;)Ljava/lang/String;

    move-result-object v2

    .line 59
    :goto_1
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    :cond_0
    invoke-static {p0}, Lcom/vkontakte/android/attachments/PostAttachment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/attachments/PostAttachment;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 63
    return-object v0

    .end local v0    # "v":Landroid/view/View;
    :cond_1
    move-object v0, p2

    .line 55
    goto :goto_0

    .line 60
    .restart local v0    # "v":Landroid/view/View;
    :cond_2
    const-string/jumbo v2, ""

    goto :goto_1

    :cond_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/vkontakte/android/attachments/PostAttachment;->post:Lcom/vkontakte/android/NewsEntry;

    iget-object v3, v3, Lcom/vkontakte/android/NewsEntry;->displayablePreviewText:Ljava/lang/CharSequence;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_1
.end method

.method synthetic lambda$getViewForList$0(Landroid/view/View;)V
    .locals 2
    .param p1, "v1"    # Landroid/view/View;

    .prologue
    .line 62
    new-instance v0, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    iget-object v1, p0, Lcom/vkontakte/android/attachments/PostAttachment;->post:Lcom/vkontakte/android/NewsEntry;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->go(Landroid/content/Context;)Z

    return-void
.end method

.method public overrideLayoutParams()Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    .locals 1

    .prologue
    .line 76
    const/4 v0, 0x0

    return-object v0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PostAttachment;->post:Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 46
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 67
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "wall"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v0, p0, Lcom/vkontakte/android/attachments/PostAttachment;->post:Lcom/vkontakte/android/NewsEntry;

    if-nez v0, :cond_0

    move-object v0, v1

    :goto_0
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, "_"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/vkontakte/android/attachments/PostAttachment;->post:Lcom/vkontakte/android/NewsEntry;

    if-nez v2, :cond_1

    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PostAttachment;->post:Lcom/vkontakte/android/NewsEntry;

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/attachments/PostAttachment;->post:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_1
.end method
