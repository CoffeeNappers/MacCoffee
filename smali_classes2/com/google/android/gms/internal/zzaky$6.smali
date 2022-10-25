.class Lcom/google/android/gms/internal/zzaky$6;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzaky;->zza(Lcom/google/android/gms/internal/zzakq;)Lcom/google/android/gms/internal/zzakw;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/google/android/gms/internal/zzakx;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic bgW:Lcom/google/android/gms/internal/zzaky;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzaky;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaky$6;->bgW:Lcom/google/android/gms/internal/zzaky;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    check-cast p1, Lcom/google/android/gms/internal/zzakx;

    check-cast p2, Lcom/google/android/gms/internal/zzakx;

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/zzaky$6;->zza(Lcom/google/android/gms/internal/zzakx;Lcom/google/android/gms/internal/zzakx;)I

    move-result v0

    return v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzakx;Lcom/google/android/gms/internal/zzakx;)I
    .locals 4

    iget-wide v0, p1, Lcom/google/android/gms/internal/zzakx;->bgM:J

    iget-wide v2, p2, Lcom/google/android/gms/internal/zzakx;->bgM:J

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/gms/internal/zzann;->zzj(JJ)I

    move-result v0

    return v0
.end method
