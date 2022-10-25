.class public Lcom/vkontakte/android/api/auth/AuthRestore$AuthRestoreAnswer;
.super Ljava/lang/Object;
.source "AuthRestore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/auth/AuthRestore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AuthRestoreAnswer"
.end annotation


# instance fields
.field public final libverifySupport:Z

.field public final sid:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 0
    .param p1, "sid"    # Ljava/lang/String;
    .param p2, "libverifySupport"    # Z

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lcom/vkontakte/android/api/auth/AuthRestore$AuthRestoreAnswer;->sid:Ljava/lang/String;

    .line 18
    iput-boolean p2, p0, Lcom/vkontakte/android/api/auth/AuthRestore$AuthRestoreAnswer;->libverifySupport:Z

    .line 19
    return-void
.end method
