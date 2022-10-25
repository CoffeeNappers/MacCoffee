.class public final Lcom/vk/sharing/attachment/AttachmentInfo$Builder;
.super Ljava/lang/Object;
.source "AttachmentInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/sharing/attachment/AttachmentInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private accessKey:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private final data:Landroid/os/Bundle;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private mediaId:I

.field private ownerId:I

.field private ref:Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private final type:I


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 1
    .param p1, "type"    # I
    .param p2, "ref"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, p0, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->data:Landroid/os/Bundle;

    .line 123
    iput p1, p0, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->type:I

    .line 124
    iput-object p2, p0, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->ref:Ljava/lang/String;

    .line 125
    return-void
.end method


# virtual methods
.method public accessKey(Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;
    .locals 0
    .param p1, "accessKey"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 141
    iput-object p1, p0, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->accessKey:Ljava/lang/String;

    .line 142
    return-object p0
.end method

.method public build()Lcom/vk/sharing/attachment/AttachmentInfo;
    .locals 8
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 171
    new-instance v0, Lcom/vk/sharing/attachment/AttachmentInfo;

    iget v1, p0, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->type:I

    iget v2, p0, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->ownerId:I

    iget v3, p0, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->mediaId:I

    iget-object v4, p0, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->accessKey:Ljava/lang/String;

    iget-object v5, p0, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->data:Landroid/os/Bundle;

    iget-object v6, p0, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->ref:Ljava/lang/String;

    const/4 v7, 0x0

    invoke-direct/range {v0 .. v7}, Lcom/vk/sharing/attachment/AttachmentInfo;-><init>(IIILjava/lang/String;Landroid/os/Bundle;Ljava/lang/String;Lcom/vk/sharing/attachment/AttachmentInfo$1;)V

    return-object v0
.end method

.method public mediaId(I)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;
    .locals 0
    .param p1, "mediaId"    # I
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 135
    iput p1, p0, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->mediaId:I

    .line 136
    return-object p0
.end method

.method public ownerId(I)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;
    .locals 0
    .param p1, "ownerId"    # I
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 129
    iput p1, p0, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->ownerId:I

    .line 130
    return-object p0
.end method

.method public put(Ljava/lang/String;I)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "value"    # I
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 147
    iget-object v0, p0, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->data:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 148
    return-object p0
.end method

.method public put(Ljava/lang/String;Landroid/os/Parcelable;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "value"    # Landroid/os/Parcelable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 159
    iget-object v0, p0, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->data:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 160
    return-object p0
.end method

.method public put(Ljava/lang/String;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "value"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 153
    iget-object v0, p0, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->data:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    return-object p0
.end method

.method public put(Ljava/lang/String;Ljava/util/ArrayList;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<+",
            "Landroid/os/Parcelable;",
            ">;)",
            "Lcom/vk/sharing/attachment/AttachmentInfo$Builder;"
        }
    .end annotation

    .prologue
    .line 165
    .local p2, "value":Ljava/util/ArrayList;, "Ljava/util/ArrayList<+Landroid/os/Parcelable;>;"
    iget-object v0, p0, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->data:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 166
    return-object p0
.end method
