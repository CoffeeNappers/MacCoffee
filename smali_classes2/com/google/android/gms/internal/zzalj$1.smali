.class Lcom/google/android/gms/internal/zzalj$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzalj;->zzax(Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic bhE:Ljava/util/ArrayList;

.field final synthetic bhF:Lcom/google/android/gms/internal/zzalj;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzalj;Ljava/util/ArrayList;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzalj$1;->bhF:Lcom/google/android/gms/internal/zzalj;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzalj$1;->bhE:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalj$1;->bhE:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzalh;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzalj$1;->bhF:Lcom/google/android/gms/internal/zzalj;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzalj;->zza(Lcom/google/android/gms/internal/zzalj;)Lcom/google/android/gms/internal/zzalw;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzalj$1;->bhF:Lcom/google/android/gms/internal/zzalj;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzalj;->zza(Lcom/google/android/gms/internal/zzalj;)Lcom/google/android/gms/internal/zzalw;

    move-result-object v3

    const-string/jumbo v4, "Raising "

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzalh;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_1

    invoke-virtual {v4, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :goto_1
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v3, v1, v4}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    invoke-interface {v0}, Lcom/google/android/gms/internal/zzalh;->zzcxk()V

    goto :goto_0

    :cond_1
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v4}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    return-void
.end method
