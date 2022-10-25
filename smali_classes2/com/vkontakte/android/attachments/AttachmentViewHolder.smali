.class public Lcom/vkontakte/android/attachments/AttachmentViewHolder;
.super Ljava/lang/Object;
.source "AttachmentViewHolder.java"


# instance fields
.field private final tag:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "tag"    # Ljava/lang/String;

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    iput-object p1, p0, Lcom/vkontakte/android/attachments/AttachmentViewHolder;->tag:Ljava/lang/String;

    .line 8
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 12
    iget-object v0, p0, Lcom/vkontakte/android/attachments/AttachmentViewHolder;->tag:Ljava/lang/String;

    return-object v0
.end method
