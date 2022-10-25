.class public Lcom/vkontakte/android/attachments/NoteAttachment;
.super Lcom/vkontakte/android/attachments/Attachment;
.source "NoteAttachment.java"


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/attachments/NoteAttachment;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field nid:I

.field oid:I

.field title:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 27
    new-instance v0, Lcom/vkontakte/android/attachments/NoteAttachment$1;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/NoteAttachment$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/attachments/NoteAttachment;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .param p1, "_title"    # Ljava/lang/String;
    .param p2, "_oid"    # I
    .param p3, "_nid"    # I

    .prologue
    .line 21
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/vkontakte/android/attachments/NoteAttachment;->title:Ljava/lang/String;

    .line 23
    iput p2, p0, Lcom/vkontakte/android/attachments/NoteAttachment;->oid:I

    .line 24
    iput p3, p0, Lcom/vkontakte/android/attachments/NoteAttachment;->nid:I

    .line 25
    return-void
.end method


# virtual methods
.method public getFullView(Landroid/content/Context;)Landroid/view/View;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 48
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/vkontakte/android/attachments/NoteAttachment;->getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "reuse"    # Landroid/view/View;

    .prologue
    .line 53
    if-nez p2, :cond_0

    const-string/jumbo v1, "common"

    invoke-static {p1, v1}, Lcom/vkontakte/android/attachments/NoteAttachment;->getReusableView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    .line 54
    .local v0, "v":Landroid/view/View;
    :goto_0
    const v1, 0x7f1001ef

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    const v2, 0x7f01000f

    invoke-static {p1, v2}, Lcom/vkontakte/android/ViewUtils;->getResFromTheme(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 55
    const v1, 0x7f1001dc

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/vkontakte/android/attachments/NoteAttachment;->title:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    const v1, 0x7f1001dd

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const v2, 0x7f0800d8

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 57
    invoke-static {p0, p1}, Lcom/vkontakte/android/attachments/NoteAttachment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/attachments/NoteAttachment;Landroid/content/Context;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 59
    return-object v0

    .end local v0    # "v":Landroid/view/View;
    :cond_0
    move-object v0, p2

    .line 53
    goto :goto_0
.end method

.method synthetic lambda$getViewForList$0(Landroid/content/Context;Landroid/view/View;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "v1"    # Landroid/view/View;

    .prologue
    .line 57
    new-instance v0, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;-><init>()V

    iget v1, p0, Lcom/vkontakte/android/attachments/NoteAttachment;->oid:I

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->setOid(I)Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/attachments/NoteAttachment;->nid:I

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->setNid(I)Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/attachments/NoteAttachment;->title:Ljava/lang/String;

    .line 58
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->setTitle(Ljava/lang/String;)Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->go(Landroid/content/Context;)Z

    .line 57
    return-void
.end method

.method public overrideLayoutParams()Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    .locals 1

    .prologue
    .line 69
    const/4 v0, 0x0

    return-object v0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 41
    iget-object v0, p0, Lcom/vkontakte/android/attachments/NoteAttachment;->title:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 42
    iget v0, p0, Lcom/vkontakte/android/attachments/NoteAttachment;->oid:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 43
    iget v0, p0, Lcom/vkontakte/android/attachments/NoteAttachment;->nid:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 44
    return-void
.end method
