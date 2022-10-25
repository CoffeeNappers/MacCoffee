.class public final Lcom/my/tracker/providers/d$b;
.super Ljava/lang/Object;
.source "EnvironmentParamsDataProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/my/tracker/providers/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:I


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .prologue
    const/4 v0, -0x1

    .line 276
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 269
    iput v0, p0, Lcom/my/tracker/providers/d$b;->b:I

    .line 270
    iput v0, p0, Lcom/my/tracker/providers/d$b;->c:I

    .line 271
    iput v0, p0, Lcom/my/tracker/providers/d$b;->d:I

    .line 272
    iput v0, p0, Lcom/my/tracker/providers/d$b;->e:I

    .line 273
    iput v0, p0, Lcom/my/tracker/providers/d$b;->f:I

    .line 277
    iput-object p1, p0, Lcom/my/tracker/providers/d$b;->a:Ljava/lang/String;

    .line 278
    return-void
.end method
