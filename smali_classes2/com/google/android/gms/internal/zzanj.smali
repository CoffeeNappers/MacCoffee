.class public Lcom/google/android/gms/internal/zzanj;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzanf;


# instance fields
.field private final bkf:Lcom/google/android/gms/internal/zzanf;

.field private bkg:J


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzanf;J)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/google/android/gms/internal/zzanj;->bkg:J

    iput-object p1, p0, Lcom/google/android/gms/internal/zzanj;->bkf:Lcom/google/android/gms/internal/zzanf;

    iput-wide p2, p0, Lcom/google/android/gms/internal/zzanj;->bkg:J

    return-void
.end method


# virtual methods
.method public z()J
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzanj;->bkf:Lcom/google/android/gms/internal/zzanf;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzanf;->z()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzanj;->bkg:J

    add-long/2addr v0, v2

    return-wide v0
.end method

.method public zzcn(J)V
    .locals 1

    iput-wide p1, p0, Lcom/google/android/gms/internal/zzanj;->bkg:J

    return-void
.end method
