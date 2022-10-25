.class public Lcom/vkontakte/android/attachments/WikiAttachment;
.super Lcom/vkontakte/android/attachments/Attachment;
.source "WikiAttachment.java"


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/attachments/WikiAttachment;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field oid:I

.field pid:I

.field public transient refer:Ljava/lang/String;

.field section:Ljava/lang/String;

.field title:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 38
    new-instance v0, Lcom/vkontakte/android/attachments/WikiAttachment$1;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/WikiAttachment$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/attachments/WikiAttachment;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;II)V
    .locals 1
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "section"    # Ljava/lang/String;
    .param p3, "oid"    # I
    .param p4, "pid"    # I

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 21
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/attachments/WikiAttachment;->refer:Ljava/lang/String;

    .line 24
    iput-object p1, p0, Lcom/vkontakte/android/attachments/WikiAttachment;->title:Ljava/lang/String;

    .line 25
    iput-object p2, p0, Lcom/vkontakte/android/attachments/WikiAttachment;->section:Ljava/lang/String;

    .line 26
    iput p3, p0, Lcom/vkontakte/android/attachments/WikiAttachment;->oid:I

    .line 27
    iput p4, p0, Lcom/vkontakte/android/attachments/WikiAttachment;->pid:I

    .line 28
    return-void
.end method


# virtual methods
.method public getFullView(Landroid/content/Context;)Landroid/view/View;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 51
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/vkontakte/android/attachments/WikiAttachment;->getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "reuse"    # Landroid/view/View;

    .prologue
    .line 56
    if-nez p2, :cond_0

    const-string/jumbo v1, "common"

    invoke-static {p1, v1}, Lcom/vkontakte/android/attachments/WikiAttachment;->getReusableView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    .line 57
    .local v0, "v":Landroid/view/View;
    :goto_0
    const v1, 0x7f1001ef

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    const v2, 0x7f01000e

    invoke-static {p1, v2}, Lcom/vkontakte/android/ViewUtils;->getResFromTheme(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 58
    const v1, 0x7f1001dc

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/vkontakte/android/attachments/WikiAttachment;->title:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    const v1, 0x7f1001dd

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const v2, 0x7f0800dd

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 60
    invoke-static {p0}, Lcom/vkontakte/android/attachments/WikiAttachment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/attachments/WikiAttachment;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 62
    return-object v0

    .end local v0    # "v":Landroid/view/View;
    :cond_0
    move-object v0, p2

    .line 56
    goto :goto_0
.end method

.method synthetic lambda$getViewForList$0(Landroid/view/View;)V
    .locals 2
    .param p1, "v1"    # Landroid/view/View;

    .prologue
    .line 60
    new-instance v0, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;-><init>()V

    iget v1, p0, Lcom/vkontakte/android/attachments/WikiAttachment;->oid:I

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->setOid(I)Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/attachments/WikiAttachment;->pid:I

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->setPid(I)Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/attachments/WikiAttachment;->title:Ljava/lang/String;

    .line 61
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->setTitle(Ljava/lang/String;)Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/attachments/WikiAttachment;->section:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->setSection(Ljava/lang/String;)Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/attachments/WikiAttachment;->refer:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->setRefer(Ljava/lang/String;)Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->go(Landroid/content/Context;)Z

    .line 60
    return-void
.end method

.method public overrideLayoutParams()Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    .locals 1

    .prologue
    .line 71
    const/4 v0, 0x0

    return-object v0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "p"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vkontakte/android/attachments/WikiAttachment;->title:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 33
    iget-object v0, p0, Lcom/vkontakte/android/attachments/WikiAttachment;->section:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 34
    iget v0, p0, Lcom/vkontakte/android/attachments/WikiAttachment;->oid:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 35
    iget v0, p0, Lcom/vkontakte/android/attachments/WikiAttachment;->pid:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 36
    return-void
.end method
