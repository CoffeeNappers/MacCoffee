###### Class su.operator555.vkcoffee.attachments.PhotoAttachment.Image (su.operator555.vkcoffee.attachments.PhotoAttachment$Image)
.class public Lcom/vkontakte/android/attachments/PhotoAttachment$Image;
.super Ljava/lang/Object;
.source "PhotoAttachment.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/attachments/PhotoAttachment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Image"
.end annotation


# instance fields
.field public height:I

.field public type:C

.field public url:Ljava/lang/String;

.field public width:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 408
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(CLjava/lang/String;II)V
    .registers 5
    .param p1, "var1"    # C
    .param p2, "var2"    # Ljava/lang/String;
    .param p3, "var3"    # I
    .param p4, "var4"    # I

    .line 410
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 411
    iput-char p1, p0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->type:C

    .line 412
    iput-object p2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->url:Ljava/lang/String;

    .line 413
    iput p3, p0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->width:I

    .line 414
    iput p4, p0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->height:I

    .line 415
    return-void
.end method

