.class public Lcom/google/android/gms/internal/zzaik;
.super Lcom/google/android/gms/internal/zzaio;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/android/gms/internal/zzaio",
        "<TK;TV;>;"
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/zzaim;Lcom/google/android/gms/internal/zzaim;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;",
            "Lcom/google/android/gms/internal/zzaim",
            "<TK;TV;>;",
            "Lcom/google/android/gms/internal/zzaim",
            "<TK;TV;>;)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/gms/internal/zzaio;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/zzaim;Lcom/google/android/gms/internal/zzaim;)V

    return-void
.end method


# virtual methods
.method protected zza(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/zzaim;Lcom/google/android/gms/internal/zzaim;)Lcom/google/android/gms/internal/zzaio;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;",
            "Lcom/google/android/gms/internal/zzaim",
            "<TK;TV;>;",
            "Lcom/google/android/gms/internal/zzaim",
            "<TK;TV;>;)",
            "Lcom/google/android/gms/internal/zzaio",
            "<TK;TV;>;"
        }
    .end annotation

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaik;->getKey()Ljava/lang/Object;

    move-result-object p1

    :cond_0
    if-nez p2, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaik;->getValue()Ljava/lang/Object;

    move-result-object p2

    :cond_1
    if-nez p3, :cond_2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaik;->zzcrs()Lcom/google/android/gms/internal/zzaim;

    move-result-object p3

    :cond_2
    if-nez p4, :cond_3

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaik;->zzcrt()Lcom/google/android/gms/internal/zzaim;

    move-result-object p4

    :cond_3
    new-instance v0, Lcom/google/android/gms/internal/zzaik;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/google/android/gms/internal/zzaik;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/zzaim;Lcom/google/android/gms/internal/zzaim;)V

    return-object v0
.end method

.method protected zzcrp()Lcom/google/android/gms/internal/zzaim$zza;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzaim$zza;->ban:Lcom/google/android/gms/internal/zzaim$zza;

    return-object v0
.end method

.method public zzcrq()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
